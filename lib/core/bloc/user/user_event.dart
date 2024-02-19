import 'package:memo/packages/packages.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserGetted extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserSubmitted extends UserEvent {
  final String image;

  const UserSubmitted({
    required this.image,
  });

  @override
  List<Object?> get props => [
        image,
      ];
}
