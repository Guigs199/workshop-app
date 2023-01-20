import 'package:workshop_app/app/shared/utils.dart';

class DrawModel {
  final String giftPhoto;
  final String mallName;
  final String code;
  final String id;
  final String name;
  final String gift;
  final String giftId;
  final DateTime expiredAt;
  final DateTime createdAt;

  DrawModel({
    required this.giftPhoto,
    required this.mallName,
    required this.code,
    required this.id,
    required this.name,
    required this.gift,
    required this.giftId,
    required this.expiredAt,
    required this.createdAt,
  });

  factory DrawModel.empty() {
    return DrawModel(
      giftPhoto: "",
      mallName: "",
      code: "",
      id: "",
      name: "",
      gift: "",
      giftId: "",
      createdAt: DateTime.now(),
      expiredAt: DateTime.now(),
    );
  }

  factory DrawModel.fromJson(Map<String, dynamic> json) {
    return DrawModel(
      giftPhoto: json['giftPhoto'],
      mallName: json['mallName'],
      code: json['code'],
      id: json['id'],
      name: json['name'],
      gift: json['gift'],
      giftId: json['giftId'],
      expiredAt: getDate(json['expiredAt']) ?? DateTime.now(),
      createdAt: getDate(json['createdAt']) ?? DateTime.now(),
    );
  }
}
