import 'package:fpdart/fpdart.dart';
import 'package:notes_flutter/core/error/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failures, SuccessType>> call(Params params);
}

class NoParams{}
