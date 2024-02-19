import 'package:memo/packages/packages.dart';

export 'data_check.dart';

class Checkin extends Equatable {
  final String? message;
  final DataCheckin? settings;

  const Checkin({
    required this.message,
    required this.settings,
  });

  @override
  List<Object?> get props => [
        message,
        settings,
      ];
}

class Checkout extends Equatable {
  final int? data;
  final String? message;

  const Checkout({
    required this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}
