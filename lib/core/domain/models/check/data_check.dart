import 'package:memo/packages/packages.dart';

class DataCheckin extends Equatable {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? deletedAt;
  final int? interval;
  final int? hbInterval;
  final int? notifInterval;
  final int? lkmInterval;

  const DataCheckin({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.interval,
    required this.hbInterval,
    required this.notifInterval,
    required this.lkmInterval,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        deletedAt,
        interval,
        hbInterval,
        notifInterval,
        lkmInterval,
      ];
}
