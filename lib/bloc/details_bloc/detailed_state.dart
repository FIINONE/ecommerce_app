import 'package:ecommerce_app/models/seller_model.dart';

abstract class DetailedState {}

class DetailedLoading extends DetailedState {}

class DetailedError extends DetailedState {
  final String message;

  DetailedError({
    required this.message,
  });
}

class DetailedData extends DetailedState {
  final SellerModel data;

  DetailedData({
    required this.data,
  });
}

extension DetailedUnion on DetailedState {
  T map<T>({
    required T Function(DetailedLoading) loading,
    required T Function(DetailedError) error,
    required T Function(DetailedData) data,
  }) {
    if (this is DetailedLoading) return loading(this as DetailedLoading);
    if (this is DetailedError) return error(this as DetailedError);
    if (this is DetailedData) return data(this as DetailedData);

    throw AssertionError('Union does not match any possible values');
  }
}
