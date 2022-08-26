import 'package:ecommerce_app/models/cart_model.dart';

abstract class MyCartState {}

class MyCartLoading extends MyCartState {}

class MyCartError extends MyCartState {
  final String message;

  MyCartError({
    required this.message,
  });
}

class MyCartData extends MyCartState {
  final CartModel data;

  MyCartData({
    required this.data,
  });
}

extension MyCartUnion on MyCartState {
  T map<T>({
    required T Function(MyCartLoading) loading,
    required T Function(MyCartError) error,
    required T Function(MyCartData) data,
  }) {
    if (this is MyCartLoading) return loading(this as MyCartLoading);
    if (this is MyCartError) return error(this as MyCartError);
    if (this is MyCartData) return data(this as MyCartData);

    throw AssertionError('Union does not match any possible values');
  }
}
