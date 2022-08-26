import 'package:ecommerce_app/common/errors/failures.dart';
import 'package:ecommerce_app/common/network/network.dart';
import 'package:ecommerce_app/models/seller_model.dart';
import 'package:either_dart/either.dart';

class DetailedProvider {
  
  final ApiRouter apiRouter;

  const DetailedProvider(this.apiRouter);

  Future<Either<Failure, SellerModel>> getDetails() async {
    try {
      final result = await apiRouter.sendRequest(path: HttpPath.details);

      final SellerModel model = SellerModel.fromMap(result.map);

      return Right(model);
    } on HttpException catch (e) {
      return HttpException.statusCodeFailure(e.statusCode, e.map);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}