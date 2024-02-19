import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentCheck {
  final CheckRepository checkRepository;

  GetCurrentCheck(
    this.checkRepository,
  );

  Future<Either<Failure, Checkin>> postCheckin() {
    return checkRepository.postCurrentCheckin();
  }

  Future<Either<Failure, Checkout>> postCheckout() {
    return checkRepository.postCurrentCheckout();
  }
}
