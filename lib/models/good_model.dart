import 'package:equatable/equatable.dart';

class GoodModel extends Equatable {
  final int id;
  final String images;
  final int price;
  final String title;
  final int count;
  
  const GoodModel({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
    this.count = 1,
  });

  GoodModel copyWith({
    int? id,
    String? images,
    int? price,
    String? title,
    int? count,
  }) {
    return GoodModel(
      id: id ?? this.id,
      images: images ?? this.images,
      price: price ?? this.price,
      title: title ?? this.title,
      count: count ?? this.count,
    );
  }

  factory GoodModel.fromMap(Map<String, dynamic> map) {
    return GoodModel(
      id: map['id']?.toInt(),
      images: map['images'],
      price: map['price']?.toInt(),
      title: map['title'],
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      images,
      price,
      title,
      count,
    ];
  }
}
