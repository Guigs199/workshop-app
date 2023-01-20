import 'package:workshop_app/app/modules/forms/infra/models/draw_model.dart';
import 'package:workshop_app/app/modules/forms/infra/models/gift_model.dart';

import '../../../shared/utils.dart';

class GiftDatasource {
  Future<List<GiftModel>> fetchGifts() async {
    List<GiftModel> gifts = [];
    const url = "${ApiConstants.base}/Gifts";
    final result = await Dio().get(url);
    if(result.statusCode == 200) {
      for (var json in result.data['data']) {
        gifts.add(GiftModel.fromJson(json));
      }
    }
    return gifts;
  }

  Future<DrawModel> fetchDraw(String name) async {
    DrawModel draw = DrawModel.empty();
    final url = "${ApiConstants.base}/PrizeDraws/$name";
    final result = await Dio().post(url);
    if(result.statusCode == 200) {
      draw = DrawModel.fromJson(result.data['data']);
    }
    return draw;
  }
}