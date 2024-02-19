import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class CheckRepository {
  Future<Either<Failure, Checkin>> postCurrentCheckin();
  Future<Either<Failure, Checkout>> postCurrentCheckout();
}
