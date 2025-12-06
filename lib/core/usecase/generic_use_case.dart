import 'package:dartz/dartz.dart';
import 'package:myzani/core/errors/failure.dart';

abstract class UseCase<type, params> {
  Either<Failure, type> call(params params);
}

abstract class ParamsUseCase<type, params> {
   type call(params params);
}

abstract class NoParamsUseCase<type> {
   type call();
}
