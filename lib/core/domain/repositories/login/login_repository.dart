import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> postCurrentLogin(
    String? username,
    String? password,
  );
}
