import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFilterCubit extends Cubit<bool> {
  HomeFilterCubit() : super(false);

  void toggleShow() {
    emit(!state);
  }
}
