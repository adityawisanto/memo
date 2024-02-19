import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentLocation {
  final LocationRepository locationRepository;

  GetCurrentLocation(
    this.locationRepository,
  );

  Future<Either<Failure, String>> post() {
    return locationRepository.postCurrentLocation();
  }
}
