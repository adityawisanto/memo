import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentAssign {
  final AssignRepository assignRepository;

  GetCurrentAssign(
    this.assignRepository,
  );

  Future<Either<Failure, String>> post(
    int? idAssign,
    String? status,
  ) {
    return assignRepository.postCurrentAssign(
      idAssign,
      status,
    );
  }
}
