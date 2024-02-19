import 'package:memo/packages/packages.dart';

class DataUser extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? gender;
  final String? createdAt;
  final String? nameBm;
  final String? phoneBm;
  final String? servicePoint;
  final String? avatar;

  const DataUser({
    required this.id,
    required this.name,
    required this.phone,
    required this.gender,
    required this.createdAt,
    required this.nameBm,
    required this.phoneBm,
    required this.servicePoint,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        gender,
        createdAt,
        nameBm,
        phoneBm,
        servicePoint,
        avatar,
      ];
}
