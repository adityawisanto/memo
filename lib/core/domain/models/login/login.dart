import 'package:memo/packages/packages.dart';

class Login extends Equatable {
  final String token;

  const Login({
    required this.token,
  });

  @override
  List<Object?> get props => [
        token,
      ];
}
