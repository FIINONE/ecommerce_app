import 'package:ecommerce_app/bloc/home_bloc/home_state.dart';
import 'package:ecommerce_app/data/providers/home_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(this.homeProvider) : super(HomeLoading());

  final HomeProvider homeProvider;

  Future<void> getInfo() async {
    emit(HomeLoading());

    final result = await homeProvider.getInfo();

    result.fold(
      (error) => emit(HomeError(message: error.message)),
      (homeData) => emit(HomeData(stores: homeData.homestore, bestSeller: homeData.bestseller)),
    );
  }
}
