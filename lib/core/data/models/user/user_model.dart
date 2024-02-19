import 'package:memo/packages/packages.dart';

class UserModel extends Equatable {
  final DataUserModel? data;

  const UserModel({
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      data: DataUserModel.fromJson(
        json["data"],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  User toEntity() => User(
        data: DataUser(
          id: data!.id,
          name: data!.name,
          phone: data!.phone,
          gender: data!.gender,
          createdAt: data!.createdAt,
          nameBm: data!.nameBm,
          phoneBm: data!.phoneBm,
          servicePoint: data!.servicePoint,
          avatar: data!.avatar,
        ),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
