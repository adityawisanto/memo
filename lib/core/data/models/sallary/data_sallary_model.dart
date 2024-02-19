import 'package:memo/packages/packages.dart';

class DataSallaryModel extends Equatable {
  final int? total;
  final String? updatedAt;

  const DataSallaryModel({
    required this.total,
    required this.updatedAt,
  });

  factory DataSallaryModel.fromJson(Map<String, dynamic> json) {
    return DataSallaryModel(
      total: json["total"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "updated_at": updatedAt,
      };

  DataSallary toEntity() => DataSallary(
        total: total,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        total,
        updatedAt,
      ];
}
