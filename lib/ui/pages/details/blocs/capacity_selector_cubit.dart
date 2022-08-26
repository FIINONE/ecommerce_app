import 'package:bloc/bloc.dart';

class CapacitySelectorCubit extends Cubit<String> {
  CapacitySelectorCubit({required String initial}) : super(initial);

  void selected (String capacity) {
    emit(capacity);
  }
}
