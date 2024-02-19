import 'package:memo/packages/packages.dart';

class DataUserModel extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? gender;
  final String? createdAt;
  final String? nameBm;
  final String? phoneBm;
  final String? servicePoint;
  final String? avatar;

  const DataUserModel({
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

  factory DataUserModel.fromJson(Map<String, dynamic> json) {
    return DataUserModel(
      id: json["id_user"],
      name: json["name_user"],
      phone: json["phone_user"],
      gender: json["gender_user"],
      createdAt: json["since_user"],
      nameBm: json["name_bm"],
      phoneBm: json["phone_bm"],
      servicePoint: json["sp_bm"],
      avatar: json["avatar"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_user": id,
        "name_user": name,
        "phone_user": phone,
        "gender_user": gender,
        "since_user": createdAt,
        "name_bm": nameBm,
        "phone_bm": phoneBm,
        "sp_bm": servicePoint,
        "avatar": avatar,
      };

  DataUser toEntity() => DataUser(
        id: id,
        name: name,
        phone: phone,
        gender: gender,
        createdAt: createdAt,
        nameBm: nameBm,
        phoneBm: phoneBm,
        servicePoint: servicePoint,
        avatar: avatar,
      );

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
