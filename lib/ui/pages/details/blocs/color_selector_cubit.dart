import 'package:flutter_bloc/flutter_bloc.dart';

class ColorSelectorCubit extends Cubit<String> {
  ColorSelectorCubit({required String colorValue}) : super(colorValue);

  void selected(String colorValue) {
    emit(colorValue);
  }
}
