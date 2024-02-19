import 'package:memo/packages/packages.dart';

class DataStatusModel extends Equatable {
  final int? idStatus;
  final String? titleStatus;
  final int? idDetailStatus;
  final String? detailStatus;

  const DataStatusModel({
    required this.idStatus,
    required this.titleStatus,
    required this.idDetailStatus,
    required this.detailStatus,
  });

  factory DataStatusModel.fromJson(Map<String, dynamic> json) {
    return DataStatusModel(
      idStatus: json["id_status"],
      titleStatus: json["title_status"],
      idDetailStatus: json["id_detail_status"],
      detailStatus: json["detail_status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_status": idStatus,
        "title_status": titleStatus,
        "id_detail_status": idDetailStatus,
        "detail_status": detailStatus,
      };

  DataStatus toEntity() => DataStatus(
        idStatus: idStatus,
        titleStatus: titleStatus,
        idDetailStatus: idDetailStatus,
        detailStatus: detailStatus,
      );

  @override
  List<Object?> get props => [
        idStatus,
        titleStatus,
        idDetailStatus,
        detailStatus,
      ];
}
