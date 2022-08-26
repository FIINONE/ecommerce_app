import 'package:ecommerce_app/bloc/details_bloc/detailed_bloc.dart';
import 'package:ecommerce_app/bloc/home_bloc/home_bloc.dart';
import 'package:ecommerce_app/bloc/my_cart_bloc/my_cart_bloc.dart';
import 'package:ecommerce_app/common/routes/app_routes.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DetailedBloc>()),
        BlocProvider(create: (context) => getIt<HomeBloc>()),
        BlocProvider(create: (context) => getIt<MyCartBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            elevation: 0,
          ),
        ),
        onGenerateRoute: (settings) => AppRoutes.instance.onGenerateRoute(settings, context),
        initialRoute: AppRoutesName.splashScrean,
      ),
    );
  }
}
