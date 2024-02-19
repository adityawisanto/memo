import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, String>> postCurrentUser(
    String image,
  );
}
