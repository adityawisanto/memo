import 'package:memo/packages/packages.dart';

export 'data_report.dart';
export 'report_item.dart';

class Report extends Equatable {
  final List<DataReport>? data;

  const Report({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
