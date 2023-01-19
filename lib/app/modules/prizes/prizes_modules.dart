import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/prizes/external/gift_datasource.dart';
import 'package:workshop_app/app/modules/prizes/ui/pages/wheel_page.dart';
import 'package:workshop_app/app/modules/prizes/ui/stores/wheel_stores.dart';
import 'package:workshop_app/app/shared/utils.dart';

class PrizesModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(PodiPages.wheelPage(false),
        child: (context, args) => WheelPage()
        ),
  ];

  static List<Bind> export = [
    Bind.lazySingleton((i) => GiftDatasource()),
    Bind.lazySingleton((i) => WheelStore(i())),
  ];
}
