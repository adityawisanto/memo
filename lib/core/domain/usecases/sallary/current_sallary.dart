import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentSallary {
  final SallaryRepository sallaryRepository;

  GetCurrentSallary(
    this.sallaryRepository,
  );

  Future<Either<Failure, Sallary>> get() {
    return sallaryRepository.getCurrentSallary();
  }
}
