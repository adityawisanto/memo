import 'package:memo/packages/packages.dart';

abstract class AssignEvent extends Equatable {
  const AssignEvent();

  @override
  List<Object?> get props => [];
}

class AssignSubmitted extends AssignEvent {
  final int? idAssign;
  final String? status;

  const AssignSubmitted({
    required this.idAssign,
    required this.status,
  });

  @override
  List<Object?> get props => [
        idAssign,
        status,
      ];
}
