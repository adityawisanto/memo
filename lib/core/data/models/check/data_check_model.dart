import 'package:memo/packages/packages.dart';

class DataCheckinModel extends Equatable {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? deletedAt;
  final int? interval;
  final int? hbInterval;
  final int? notifInterval;
  final int? lkmInterval;

  const DataCheckinModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.interval,
    required this.hbInterval,
    required this.notifInterval,
    required this.lkmInterval,
  });

  factory DataCheckinModel.fromJson(Map<String, dynamic> json) {
    return DataCheckinModel(
      id: json["ID"],
      createdAt: json["CreatedAt"],
      updatedAt: json["UpdatedAt"],
      deletedAt: json["DeletedAt"],
      interval: json["interval"],
      hbInterval: json["hb_interval"],
      notifInterval: json["notif_interval"],
      lkmInterval: json["lkm_interval"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "interval": interval,
        "hb_interval": hbInterval,
        "notif_interval": notifInterval,
        "lkm_interval": lkmInterval,
      };

  DataCheckinModel toEntity() => DataCheckinModel(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        interval: interval,
        hbInterval: hbInterval,
        notifInterval: notifInterval,
        lkmInterval: lkmInterval,
      );

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
