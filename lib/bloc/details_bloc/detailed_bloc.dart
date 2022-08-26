import 'package:ecommerce_app/bloc/details_bloc/detailed_state.dart';
import 'package:ecommerce_app/data/providers/detailed_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedBloc extends Cubit<DetailedState> {
  DetailedBloc(this.detailedProvider) : super(DetailedLoading());

  final DetailedProvider detailedProvider;

  Future<void> getDetailed() async {
    emit(DetailedLoading());

    final result = await detailedProvider.getDetails();

    result.fold(
      (error) => emit(DetailedError(message: error.message)),
      (seller) => emit(DetailedData(data: seller)),
    );
  }
}
