import 'package:memo/packages/packages.dart';

class DataSallary extends Equatable {
  final int? total;
  final String? updatedAt;

  const DataSallary({
    required this.total,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        total,
        updatedAt,
      ];
}
