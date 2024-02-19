import 'package:memo/packages/packages.dart';

class BundleModel extends Equatable {
  final String message;

  const BundleModel({
    required this.message,
  });

  factory BundleModel.fromJson(Map<String, dynamic> json) {
    return BundleModel(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
      };

  Bundle toEntity() => Bundle(
        message: message,
      );

  @override
  List<Object?> get props => [
        message,
      ];
}
