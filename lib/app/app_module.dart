import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/shared/utils.dart';

import 'modules/forms/forms_module.dart';
import 'modules/prizes/prizes_modules.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...FormsModule.exports,
    ...PrizesModule.export,
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(PodiPages.formModule, module: FormsModule()),
    ModuleRoute(PodiPages.prizesModule, module: PrizesModule()),
  ];
}
