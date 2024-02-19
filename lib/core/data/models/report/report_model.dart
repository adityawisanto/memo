import 'package:memo/packages/packages.dart';

class ReportModel extends Equatable {
  final List<DataReportModel>? data;

  const ReportModel({
    required this.data,
  });

  factory ReportModel.fromJson(
    Map<String, dynamic> json,
    List<ReportItemModel>? listItem,
  ) {
    return ReportModel(
      data: List<DataReportModel>.from(
        json["data"].map(
          (x) => DataReportModel.fromJson(
            x,
            listItem,
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Report toEntity() => Report(
        data: data!
            .map(
              (e) => DataReport(
                id: e.id,
                createdAt: e.createdAt,
                installType: e.installType,
                qty: e.qty,
                reportItem: e.reportItem!
                    .map(
                      (e) => ReportItem(
                        id: e.id,
                        name: e.name,
                        sn: e.sn,
                        qty: e.qty,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
