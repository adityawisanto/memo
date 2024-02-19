import 'package:memo/packages/packages.dart';

export 'data_user.dart';

class User extends Equatable {
  final DataUser? data;

  const User({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
