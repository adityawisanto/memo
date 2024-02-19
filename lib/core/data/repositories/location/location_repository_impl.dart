import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationSource locationSource;

  const LocationRepositoryImpl({
    required this.locationSource,
  });

  @override
  Future<Either<Failure, String>> postCurrentLocation() async {
    try {
      final result = await locationSource.postCurrentLocation();
      return Right(
        result,
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.toString()));
    } on SocketException {
      return const Left(ConnectionFailure(CustomResponse.noInternet));
    }
  }
}
