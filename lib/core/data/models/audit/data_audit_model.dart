import 'package:memo/packages/packages.dart';

class DataAuditModel extends Equatable {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? category;
  final String? def;
  final String? name;
  final String? type;
  final String? group;

  const DataAuditModel({
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

  factory DataAuditModel.fromJson(Map<String, dynamic> json) {
    return DataAuditModel(
      id: json["ID"],
      createdAt: json["CreatedAt"],
      updatedAt: json["UpdatedAt"],
      deletedAt: json["DeletedAt"],
      category: json["category"],
      def: json["def"] == "0" ? "" : "",
      name: json["name"],
      type: json["type"],
      group: json["tab"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "category": category,
        "def": def,
        "name": name,
        "type": type,
        "tab": group,
      };

  DataAudit toEntity() => DataAudit(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        def: def,
        category: category,
        name: name,
        type: type,
        group: group,
      );

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        deletedAt,
        def,
        category,
        name,
        type,
        group,
      ];
}
