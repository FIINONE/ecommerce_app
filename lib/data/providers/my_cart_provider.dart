import 'package:ecommerce_app/common/errors/failures.dart';
import 'package:ecommerce_app/common/network/network.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:either_dart/either.dart';

class MyCartProvider {
  final ApiRouter apiRouter;
  const MyCartProvider(this.apiRouter);

  Future<Either<Failure, CartModel>> getMyCart() async {
    try {
      final result = await apiRouter.sendRequest(path: HttpPath.myCard);

      final CartModel homeResponse = CartModel.fromMap(result.map);

      return Right(homeResponse);
    } on HttpException catch (e) {
      return HttpException.statusCodeFailure(e.statusCode, e.map);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
