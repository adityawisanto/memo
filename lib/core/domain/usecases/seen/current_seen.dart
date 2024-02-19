import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentSeen {
  final SeenRepository seenRepository;

  GetCurrentSeen(
    this.seenRepository,
  );

  Future<Either<Failure, String>> post() {
    return seenRepository.postCurrentSeen();
  }
}
