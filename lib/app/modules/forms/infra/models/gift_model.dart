class GiftModel {
  final String id;
  final String name;
  final String photo;

  GiftModel({required this.id, required this.name, required this.photo});

  factory GiftModel.fromJson(Map<String, dynamic> json) {
    return GiftModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}
