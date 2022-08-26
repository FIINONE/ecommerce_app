import 'package:ecommerce_app/models/good_model.dart';

class CartModel {
  final List<GoodModel> goods;
  final String delivery;
  final String id;
  final int total;
  CartModel({
    required this.goods,
    required this.delivery,
    required this.id,
    required this.total,
  });

  CartModel copyWith({
    List<GoodModel>? goods,
    String? delivery,
    String? id,
    int? total,
  }) {
    return CartModel(
      goods: goods ?? this.goods,
      delivery: delivery ?? this.delivery,
      id: id ?? this.id,
      total: total ?? this.total,
    );
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      goods: List<GoodModel>.from(map['basket']?.map((x) => GoodModel.fromMap(x))),
      delivery: map['delivery'],
      id: map['id'],
      total: map['total']?.toInt(),
    );
  }
}
