import 'package:ecommerce_app/common/errors/failures.dart';
import 'package:either_dart/either.dart';

class HttpException {
  final int statusCode;
  final dynamic map;

  const HttpException({
    required this.statusCode,
    required this.map,
  });

  static Left<Failure, T> statusCodeFailure<T>(int statusCode, Map<String, dynamic> map) {
    return Left(ServerFailure(map.toString()));
  }
}
