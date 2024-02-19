import 'package:memo/packages/packages.dart';

class MerchantArgument extends Equatable {
  final DataTicket? dataTicket;

  const MerchantArgument({
    required this.dataTicket,
  });

  @override
  List<Object?> get props => [
        dataTicket,
      ];
}
