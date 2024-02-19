import 'package:memo/packages/packages.dart';

class CheckinModel extends Equatable {
  final String? message;
  final DataCheckinModel? settings;

  const CheckinModel({
    required this.message,
    required this.settings,
  });

  factory CheckinModel.fromJson(Map<String, dynamic> json) {
    return CheckinModel(
      message: json["message"],
      settings: DataCheckinModel.fromJson(
        json["settings"],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "settings": settings,
      };

  Checkin toEntity() => Checkin(
        message: message,
        settings: DataCheckin(
          id: settings!.id,
          createdAt: settings!.createdAt,
          updatedAt: settings!.updatedAt,
          deletedAt: settings!.deletedAt,
          interval: settings!.interval,
          hbInterval: settings!.hbInterval,
          notifInterval: settings!.notifInterval,
          lkmInterval: settings!.lkmInterval,
        ),
      );

  @override
  List<Object?> get props => [
        message,
        settings,
      ];
}

class CheckoutModel extends Equatable {
  final int? data;
  final String? message;

  const CheckoutModel({
    required this.data,
    required this.message,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      data: json["data"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
      };

  Checkout toEntity() => Checkout(
        data: data,
        message: message,
      );

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}
