export 'summary_data_statistic.dart';
export 'summary_statistic.dart';

class SummaryCategory {
  int? id;
  String? label;

  SummaryCategory(
    this.id,
    this.label,
  );
}

List<SummaryCategory> dataSummaryCategory = [
  SummaryCategory(
    1,
    "Installation Ticket",
  ),
  SummaryCategory(
    3,
    "Corrective Maintenance",
  ),
  SummaryCategory(
    4,
    "Preventive Maintenance",
  ),
  SummaryCategory(
    7,
    "Support Maintenance",
  ),
  SummaryCategory(
    5,
    "Dismantle",
  ),
];

class SummaryChart {
  final int? id;
  final String? title;
  final int? total;

  const SummaryChart({
    required this.id,
    required this.title,
    required this.total,
  });
}
