class DataAudit {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? category;
  String? def;
  final String? name;
  final String? type;
  final String? group;

  DataAudit({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.category,
    required this.def,
    required this.name,
    required this.type,
    required this.group,
  });
}
