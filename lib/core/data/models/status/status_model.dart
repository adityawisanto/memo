import 'package:memo/packages/packages.dart';

class StatusModel extends Equatable {
  final List<DataStatusModel>? data;

  const StatusModel({
    required this.data,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      data: List<DataStatusModel>.from(
        json["data"].map(
          (x) => DataStatusModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Status toEntity() => Status(
        data: data!
            .map(
              (e) => DataStatus(
                idStatus: e.idStatus,
                titleStatus: e.titleStatus,
                idDetailStatus: e.idDetailStatus,
                detailStatus: e.detailStatus,
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
