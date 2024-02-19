import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class LocationRepository {
  Future<Either<Failure, String>> postCurrentLocation();
}
