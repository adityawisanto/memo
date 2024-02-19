import 'package:memo/packages/packages.dart';

class SummaryTicket extends StatelessWidget {
  final String titlePrimary;
  final String descriptionPrimary;
  final String titleSecondary;
  final String descriptionSecondary;

  const SummaryTicket({
    super.key,
    required this.titlePrimary,
    required this.descriptionPrimary,
    required this.titleSecondary,
    required this.descriptionSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SummaryTicketItem(
          title: titlePrimary,
          description: descriptionPrimary,
        ),
        SummaryTicketItem(
          title: titleSecondary,
          description: descriptionSecondary,
        ),
      ],
    );
  }
}
