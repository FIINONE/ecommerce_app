import 'package:ecommerce_app/models/best_seller_model.dart';
import 'package:ecommerce_app/models/home_store_model.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeData extends HomeState {
  final List<HomestoreModel> stores;
  final List<BestsellerModel> bestSeller;

  HomeData({
    required this.stores,
    required this.bestSeller,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError({
    required this.message,
  });
}

extension HomeStateUnion on HomeState {
  T map<T>({
    required T Function(HomeLoading) homeLoading,
    required T Function(HomeData) homeData,
    required T Function(HomeError) error,
  }) {
    if (this is HomeLoading) return homeLoading(this as HomeLoading);
    if (this is HomeData) return homeData(this as HomeData);
    if (this is HomeError) return error(this as HomeError);

    throw AssertionError('Union does not match any possible values');
  }
}
