import 'package:memo/packages/packages.dart';

export 'data_ticket.dart';

class Ticket extends Equatable {
  final List<DataTicket>? data;

  const Ticket({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
