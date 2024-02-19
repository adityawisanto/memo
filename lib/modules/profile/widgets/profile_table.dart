import 'package:memo/packages/packages.dart';

class ProfileTable extends StatelessWidget {
  final DataUser dataUser;
  final String device;

  const ProfileTable({
    super.key,
    required this.dataUser,
    required this.device,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16,
      ),
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(4.6),
                  1: FlexColumnWidth(0.4),
                  2: FlexColumnWidth(6),
                },
                children: [
                  ProfileTableItem.tableRow(
                    "Gender",
                    dataUser.gender.toString().toUpperCase() == "L"
                        ? "Male"
                        : "Female",
                  ),
                  ProfileTableItem.tableRow(
                    "User Since",
                    CustomDate.formatDate(
                      dataUser.createdAt.toString(),
                    ),
                  ),
                  ProfileTableItem.tableRow(
                    "Spek HP",
                    device,
                  ),
                  ProfileTableItem.tableRow(
                    "Phone Number",
                    dataUser.phone.toString(),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Divider(
                height: 1,
                color: CustomColorStyle.grayPrimary.withOpacity(
                  0.2,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(4.6),
                  1: FlexColumnWidth(0.4),
                  2: FlexColumnWidth(6),
                },
                children: [
                  ProfileTableItem.tableRow(
                    "BM Name",
                    dataUser.nameBm.toString(),
                  ),
                  ProfileTableItem.tableRow(
                    "Phone Number BM",
                    dataUser.phoneBm.toString(),
                  ),
                  ProfileTableItem.tableRow(
                    "Service Point",
                    dataUser.servicePoint.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
