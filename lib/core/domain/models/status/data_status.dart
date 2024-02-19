import 'package:memo/packages/packages.dart';

class DataStatus extends Equatable {
  final int? idStatus;
  final String? titleStatus;
  final int? idDetailStatus;
  final String? detailStatus;

  const DataStatus({
    required this.idStatus,
    required this.titleStatus,
    required this.idDetailStatus,
    required this.detailStatus,
  });

  @override
  List<Object?> get props => [
        idStatus,
        titleStatus,
        idDetailStatus,
        detailStatus,
      ];
}
