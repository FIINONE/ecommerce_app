import 'package:flutter_bloc/flutter_bloc.dart';

class CartCountCubit extends Cubit<int> {
  CartCountCubit() : super(0);

  void addCount() {
    final value = state + 1;
    emit(value);
  }
}
