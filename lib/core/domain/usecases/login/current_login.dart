import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentLogin {
  final LoginRepository loginRepository;

  GetCurrentLogin(
    this.loginRepository,
  );

  Future<Either<Failure, Login>> post(
    String? username,
    String? password,
  ) {
    return loginRepository.postCurrentLogin(
      username,
      password,
    );
  }
}
