import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentUser {
  final UserRepository userRepository;

  GetCurrentUser(
    this.userRepository,
  );

  Future<Either<Failure, User>> get() {
    return userRepository.getCurrentUser();
  }

  Future<Either<Failure, String>> post(
    String image,
  ) {
    return userRepository.postCurrentUser(
      image,
    );
  }
}
