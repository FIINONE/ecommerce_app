import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategoryCubit extends Cubit<int> {
  HomeCategoryCubit() : super(0);

  void select (int id) {
    emit(id);
  }
}
