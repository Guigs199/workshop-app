// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuestionsStore on _QuestionsStoreBase, Store {
  Computed<bool>? _$verifyChoiceComputed;

  @override
  bool get verifyChoice =>
      (_$verifyChoiceComputed ??= Computed<bool>(() => super.verifyChoice,
              name: '_QuestionsStoreBase.verifyChoice'))
          .value;

  late final _$choiceAtom =
      Atom(name: '_QuestionsStoreBase.choice', context: context);

  @override
  String? get choice {
    _$choiceAtom.reportRead();
    return super.choice;
  }

  @override
  set choice(String? value) {
    _$choiceAtom.reportWrite(value, super.choice, () {
      super.choice = value;
    });
  }

  late final _$sentChoiceAtom =
      Atom(name: '_QuestionsStoreBase.sentChoice', context: context);

  @override
  bool get sentChoice {
    _$sentChoiceAtom.reportRead();
    return super.sentChoice;
  }

  @override
  set sentChoice(bool value) {
    _$sentChoiceAtom.reportWrite(value, super.sentChoice, () {
      super.sentChoice = value;
    });
  }

  late final _$choicesAtom =
      Atom(name: '_QuestionsStoreBase.choices', context: context);

  @override
  List<ChoiceModel> get choices {
    _$choicesAtom.reportRead();
    return super.choices;
  }

  @override
  set choices(List<ChoiceModel> value) {
    _$choicesAtom.reportWrite(value, super.choices, () {
      super.choices = value;
    });
  }

  late final _$_QuestionsStoreBaseActionController =
      ActionController(name: '_QuestionsStoreBase', context: context);

  @override
  void changeChoice(String char) {
    final _$actionInfo = _$_QuestionsStoreBaseActionController.startAction(
        name: '_QuestionsStoreBase.changeChoice');
    try {
      return super.changeChoice(char);
    } finally {
      _$_QuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendChoice() {
    final _$actionInfo = _$_QuestionsStoreBaseActionController.startAction(
        name: '_QuestionsStoreBase.sendChoice');
    try {
      return super.sendChoice();
    } finally {
      _$_QuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_QuestionsStoreBaseActionController.startAction(
        name: '_QuestionsStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_QuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isSelected(String char) {
    final _$actionInfo = _$_QuestionsStoreBaseActionController.startAction(
        name: '_QuestionsStoreBase.isSelected');
    try {
      return super.isSelected(char);
    } finally {
      _$_QuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
choice: ${choice},
sentChoice: ${sentChoice},
choices: ${choices},
verifyChoice: ${verifyChoice}
    ''';
  }
}
