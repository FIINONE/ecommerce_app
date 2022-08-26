import 'package:ecommerce_app/models/good_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartListCubit extends Cubit<List<GoodModel>> {
  MyCartListCubit(List<GoodModel> list) : super(list);

  void addCount(int index) {
    final  List<GoodModel> list = [];
    list.addAll(state);
    final good = list[index];
    final newGood = good.copyWith(count: good.count + 1);
    list[index] = newGood;
    emit(list);
  }

  void removeCount(int index) {
    if (state[index].count == 1) {
      return;
    }

    
    final  List<GoodModel> list = [];
    list.addAll(state);
    final good = list[index];
    final newGood = good.copyWith(count: good.count - 1);
    list[index] = newGood;
    emit(list);
  }
}
