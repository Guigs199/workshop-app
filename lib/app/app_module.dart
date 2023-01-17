import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/shared/utils.dart';

import 'modules/forms/forms_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...FormsModule.exports,
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(PodiPages.formModule, module: FormsModule()),
  ];
}
