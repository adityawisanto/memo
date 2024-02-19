import 'package:memo/packages/packages.dart';

export 'data_audit.dart';

class Audit extends Equatable {
  final List<DataAudit>? data;

  const Audit({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
