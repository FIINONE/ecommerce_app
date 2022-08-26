import 'package:ecommerce_app/common/errors/failures.dart';
import 'package:ecommerce_app/common/network/network.dart';
import 'package:ecommerce_app/models/home_response_model.dart';
import 'package:either_dart/either.dart';

class HomeProvider {
  final ApiRouter apiRouter;

  const HomeProvider(this.apiRouter);

  Future<Either<Failure, HomeResponseModel>> getInfo() async {
    try {
      final result = await apiRouter.sendRequest(path: HttpPath.home);

      final HomeResponseModel homeResponse = HomeResponseModel.fromMap(result.map);

      return Right(homeResponse);
    } on HttpException catch (e) {
      return HttpException.statusCodeFailure(e.statusCode, e.map);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
