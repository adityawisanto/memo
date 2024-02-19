import 'package:memo/packages/packages.dart';

export 'data_sallary.dart';

class Sallary extends Equatable {
  final DataSallary? data;

  const Sallary({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
