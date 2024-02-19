import 'package:memo/packages/packages.dart';

class AuditModel extends Equatable {
  final List<DataAuditModel>? data;

  const AuditModel({
    required this.data,
  });

  factory AuditModel.fromJson(Map<String, dynamic> json) {
    return AuditModel(
      data: List<DataAuditModel>.from(
        json["data"].map(
          (x) => DataAuditModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Audit toEntity() => Audit(
        data: data!
            .map(
              (e) => DataAudit(
                id: e.id,
                createdAt: e.createdAt,
                updatedAt: e.updatedAt,
                deletedAt: e.deletedAt,
                def: e.def,
                category: e.category,
                name: e.name,
                type: e.type,
                group: e.group,
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
