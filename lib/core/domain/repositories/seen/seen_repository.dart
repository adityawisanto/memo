import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class SeenRepository {
  Future<Either<Failure, String>> postCurrentSeen();
}
