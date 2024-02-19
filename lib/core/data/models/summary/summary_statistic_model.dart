import 'package:memo/packages/packages.dart';

class SummaryStatisticModel extends Equatable {
  final List<SummaryDataStatisticModel>? data;

  const SummaryStatisticModel({
    required this.data,
  });

  factory SummaryStatisticModel.fromJson(Map<String, dynamic> json) {
    return SummaryStatisticModel(
      data: List<SummaryDataStatisticModel>.from(
        json["data"].map(
          (x) => SummaryDataStatisticModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  SummaryStatistic toEntity() => SummaryStatistic(
        data: data!
            .map(
              (e) => SummaryDataStatistic(
                installType: e.installType,
                idStatusTicket: e.idStatusTicket,
                total: e.total,
                inSla: e.inSla,
                outSla: e.outSla,
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
