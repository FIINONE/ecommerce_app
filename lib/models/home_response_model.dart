import 'package:ecommerce_app/models/best_seller_model.dart';
import 'package:ecommerce_app/models/home_store_model.dart';

class HomeResponseModel {
  final List<BestsellerModel> bestseller;
  final List<HomestoreModel> homestore;

  HomeResponseModel({
    required this.bestseller,
    required this.homestore,
  });

  factory HomeResponseModel.fromMap(Map<String, dynamic> map) {
    return HomeResponseModel(
      bestseller: List.from((map['best_seller'] as List).map((e) => BestsellerModel.fromMap(e))),
      homestore: List.from((map['home_store'] as List).map((e) => HomestoreModel.fromMap(e))),
    );
  }
}
