import 'package:memo/packages/packages.dart';

export 'data_status.dart';

class Status extends Equatable {
  final List<DataStatus>? data;

  const Status({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
