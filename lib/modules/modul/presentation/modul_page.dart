import 'package:memo/packages/packages.dart';

class ModulPage extends StatefulWidget {
  static const routeName = "/personalize";

  final ModulArgument modulArgument;

  const ModulPage({
    super.key,
    required this.modulArgument,
  });

  @override
  State<ModulPage> createState() => _ModulPageState();
}

class _ModulPageState extends State<ModulPage> {
  final assignBloc = locator<AssignBloc>();
  final customPreferences = locator<CustomPreferences>();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
  ];

  @override
  void dispose() {
    assignBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courseItem = widget.modulArgument.dataCourse!.courseItem!
        .where((e) => e.id == widget.modulArgument.dataCourse!.id)
        .toList();
    if (courseItem.isNotEmpty) {
      checkIntroModul(
        keyIntroduction,
        context,
        customPreferences,
      );
    }
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        widget.modulArgument.dataCourse!.name.toString().toUpperCase(),
        onTap: () => CustomNavigation.back(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModulBanner(
              modulArgument: widget.modulArgument,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "MODUL",
              style: CustomTextStyle.bold(
                12.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            courseItem.isEmpty
                ? CustomHandler.empty()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: courseItem.length,
                    itemBuilder: (context, index) {
                      return ModulItem(
                        key: index == 0 ? keyIntroduction[0] : null,
                        courseItem: courseItem[index],
                        assignBloc: assignBloc,
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
