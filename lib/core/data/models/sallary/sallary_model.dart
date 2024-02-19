import 'package:memo/packages/packages.dart';

class SallaryModel extends Equatable {
  final DataSallaryModel? data;

  const SallaryModel({
    required this.data,
  });

  factory SallaryModel.fromJson(Map<String, dynamic> json) {
    return SallaryModel(
      data: DataSallaryModel.fromJson(
        json["data"][0],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Sallary toEntity() => Sallary(
        data: DataSallary(
          total: data!.total,
          updatedAt: data!.updatedAt,
        ),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
