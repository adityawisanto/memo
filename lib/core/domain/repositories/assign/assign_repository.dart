import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class AssignRepository {
  Future<Either<Failure, String>> postCurrentAssign(
    int? idAssign,
    String? status,
  );
}
