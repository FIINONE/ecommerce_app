import 'package:ecommerce_app/bloc/details_bloc/detailed_bloc.dart';
import 'package:ecommerce_app/bloc/home_bloc/home_bloc.dart';
import 'package:ecommerce_app/bloc/my_cart_bloc/my_cart_bloc.dart';
import 'package:ecommerce_app/common/network/network.dart';
import 'package:ecommerce_app/data/providers/detailed_provider.dart';
import 'package:ecommerce_app/data/providers/home_provider.dart';
import 'package:ecommerce_app/data/providers/my_cart_provider.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void init() {
  /// внешние зависимости
  getIt.registerLazySingleton(() => ApiRouter.instance);

  /// providers
  getIt.registerLazySingleton(() => HomeProvider(getIt.call()));
  getIt.registerLazySingleton(() => DetailedProvider(getIt.call()));
  getIt.registerLazySingleton(() => MyCartProvider(getIt.call()));

  /// blocs
  getIt.registerLazySingleton(() => HomeBloc(getIt.call()));
  getIt.registerLazySingleton(() => DetailedBloc(getIt.call()));
  getIt.registerLazySingleton(() => MyCartBloc(getIt.call()));
}
