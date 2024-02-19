import 'package:memo/packages/packages.dart';

class LoginModel extends Equatable {
  final String token;

  const LoginModel({
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
      };

  Login toEntity() => Login(
        token: token,
      );

  @override
  List<Object?> get props => [
        token,
      ];
}
