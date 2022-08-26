class BestsellerModel {
  final int id;
  final bool isFavorites;
  final String title;
  final int priceWithoutDiscount;
  final int discountPrice;
  final String picture;
  BestsellerModel({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  BestsellerModel copyWith({
    int? id,
    bool? isFavorites,
    String? title,
    int? priceWithoutDiscount,
    int? discountPrice,
    String? picture,
  }) {
    return BestsellerModel(
      id: id ?? this.id,
      isFavorites: isFavorites ?? this.isFavorites,
      title: title ?? this.title,
      priceWithoutDiscount: priceWithoutDiscount ?? this.priceWithoutDiscount,
      discountPrice: discountPrice ?? this.discountPrice,
      picture: picture ?? this.picture,
    );
  }

  factory BestsellerModel.fromMap(Map<String, dynamic> map) {
    return BestsellerModel(
      id: map['id']?.toInt(),
      isFavorites: map['is_favorites'],
      title: map['title'],
      priceWithoutDiscount: map['price_without_discount']?.toInt(),
      discountPrice: map['discount_price']?.toInt(),
      picture: map['picture'],
    );
  }

}