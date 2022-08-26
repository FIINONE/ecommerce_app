class HomestoreModel {
  final int id;
  final bool isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;
  HomestoreModel({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  HomestoreModel copyWith({
    int? id,
    bool? isNew,
    String? title,
    String? subtitle,
    String? picture,
    bool? isBuy,
  }) {
    return HomestoreModel(
      id: id ?? this.id,
      isNew: isNew ?? this.isNew,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      picture: picture ?? this.picture,
      isBuy: isBuy ?? this.isBuy,
    );
  }

  factory HomestoreModel.fromMap(Map<String, dynamic> map) {
    return HomestoreModel(
      id: map['id']?.toInt(),
      isNew: map['is_new'] ?? false,
      title: map['title'],
      subtitle: map['subtitle'],
      picture: map['picture'],
      isBuy: map['is_buy'],
    );
  }
}
