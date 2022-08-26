import 'package:ecommerce_app/bloc/my_cart_bloc/my_cart_state.dart';
import 'package:ecommerce_app/data/providers/my_cart_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartBloc extends Cubit<MyCartState> {
  final MyCartProvider provider;

  MyCartBloc(this.provider) : super(MyCartLoading());

  Future<void> getMyCart() async {
    emit(MyCartLoading());

    final result = await provider.getMyCart();

    result.fold(
      (error) => emit(MyCartError(message: error.message)),
      (data) => emit(MyCartData(data: data)),
    );
  }
}
