import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/forms/ui/pages/questions_page.dart';
import 'package:workshop_app/app/modules/forms/ui/pages/user_page.dart';
import 'package:workshop_app/app/modules/forms/ui/stores/questions_store.dart';
import 'package:workshop_app/app/modules/forms/ui/stores/user_store.dart';
import '../../shared/utils.dart';

class FormsModule extends Module {
  static List<Bind> exports = [
    Bind.lazySingleton((i) => UserStore()),
    Bind.lazySingleton((i) => QuestionsStore()),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      PodiPages.userPage(false), 
      child: (context, args) => UserPage(),
    ),
    ChildRoute(
      PodiPages.questionPage(false), 
      child: (context, args) => QuestionPage(),
    ),
  ];
}
