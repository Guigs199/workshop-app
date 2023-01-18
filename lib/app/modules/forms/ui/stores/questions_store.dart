import 'package:mobx/mobx.dart';

import '../../infra/models/choice_model.dart';
part 'questions_store.g.dart';

class QuestionsStore = _QuestionsStoreBase with _$QuestionsStore;

abstract class _QuestionsStoreBase with Store {
  @observable
  String? choice;

  @observable
  bool sentChoice = false;

  @observable
  List<ChoiceModel> choices = [
    ChoiceModel("A", "Podi App", true),
    ChoiceModel("B", "Outro App", false),
  ];

  @action
  void changeChoice(String char) => choice = char;

  @action
  void sendChoice() => sentChoice = true;

  @computed 
  bool get verifyChoice {
    return !sentChoice || choices.firstWhere((element) => element.char == choice).isCorrect;
  }

  @action
  void clear() {
    choice = null;
    sentChoice = false;
  }

  @action
  bool isSelected(String char) {
    return choice == char;
  }
}
