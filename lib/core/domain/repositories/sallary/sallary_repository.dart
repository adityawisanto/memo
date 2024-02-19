import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class SallaryRepository {
  Future<Either<Failure, Sallary>> getCurrentSallary();
}
