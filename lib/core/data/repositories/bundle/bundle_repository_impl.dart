import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class BundleRepositoryImpl implements BundleRepository {
  final BundleSource bundleSource;

  const BundleRepositoryImpl({
    required this.bundleSource,
  });

  @override
  Future<Either<Failure, Bundle>> postCurrentBundle(
    String? idTicket,
    String? noTicket,
    String? noLkm,
    String? purchase,
    String? brizzi,
    String? qris,
    String? help,
    String? activity,
    String? note,
    String? anotherListEdc,
    String? merchantType,
    String? edcPrimary,
    String? description,
    String? edc,
    String? edcWithdrawal,
    String? item,
    String? merchantImg,
    String? cashierImg,
    String? edcImg,
    String? purchaseImg,
    String? brizziImg,
    String? qrisImg,
    String? optionalImg,
    String? optional2Img,
    String? merchantName,
    String? merchantNumber,
    String? merchantSign,
    String? officerName,
    String? officerNumber,
    String? officerSign,
    int? idStatus,
    int? idStatusDetail,
    String? statusTicket,
    String? merchantOpenTime,
    String? merchantCloseTime,
    String? merchantAddress,
  ) async {
    try {
      final result = await bundleSource.postCurrentBundle(
        idTicket,
        noTicket,
        noLkm,
        purchase,
        brizzi,
        qris,
        help,
        activity,
        note,
        anotherListEdc,
        merchantType,
        edcPrimary,
        description,
        edc,
        edcWithdrawal,
        item,
        merchantImg,
        cashierImg,
        edcImg,
        purchaseImg,
        brizziImg,
        qrisImg,
        optionalImg,
        optional2Img,
        merchantName,
        merchantNumber,
        merchantSign,
        officerName,
        officerNumber,
        officerSign,
        idStatus,
        idStatusDetail,
        statusTicket,
        merchantOpenTime,
        merchantCloseTime,
        merchantAddress,
      );
      return Right(
        result.toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.toString()));
    } on SocketException {
      return const Left(ConnectionFailure(CustomResponse.noInternet));
    }
  }
}
