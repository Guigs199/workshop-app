import 'package:mobx/mobx.dart';
import 'package:workshop_app/app/modules/forms/infra/models/gift_model.dart';
import 'package:workshop_app/app/modules/prizes/external/gift_datasource.dart';
part 'wheel_stores.g.dart';

class WheelStore = _WheelStoreBase with _$WheelStore;

abstract class _WheelStoreBase with Store {
  final GiftDatasource _datasource;
  _WheelStoreBase(this._datasource);

  @observable 
  List<GiftModel> gifts = ObservableList();

  @action 
  void clear() {
    gifts.clear();
  }

  @action
  Future<void> fetchGifts() async {
    gifts.clear();
    gifts.addAll(await _datasource.fetchGifts());
  }
}