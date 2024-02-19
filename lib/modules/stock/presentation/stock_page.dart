import 'package:memo/packages/packages.dart';

class StockPage extends StatefulWidget {
  static const routeName = "/stock";

  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  int idSelected = 1;

  bool inventory = true;
  bool history = false;

  final warehouseBloc = locator<WarehouseBloc>();
  final reportBloc = locator<ReportBloc>();
  final customPreferences = locator<CustomPreferences>();

  final List<GlobalKey> keyIntroductionInventory = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final List<GlobalKey> keyIntroductionHistory = [
    GlobalKey(),
  ];

  @override
  void dispose() {
    warehouseBloc.close();
    reportBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    checkIntroStockInventory(
      keyIntroductionInventory,
      context,
      customPreferences,
    );

    warehouseBloc.add(
      WarehouseGetted(),
    );
    reportBloc.add(
      ReportGetted(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "STOCK",
        centerTitle: false,
        automaticallyImplyLeading: false,
        colorText: CustomColorStyle.white,
        colorIcon: CustomColorStyle.white,
        backgroundColor: CustomColorStyle.redPrimary,
        withDate: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(
              16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColorStyle.orangePrimary.withOpacity(
                  0.2,
                ),
              ),
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: CustomColorStyle.white,
            ),
            height: CustomSize.height(context) / 24,
            child: Row(
              children: [
                CustomTab(
                  key: keyIntroductionInventory[0],
                  onTap: () => setState(() {
                    idSelected = 1;
                    inventory = true;
                    history = false;
                  }),
                  idSelected: idSelected,
                  index: 2,
                  title: "INVENTORY",
                ),
                CustomTab(
                  key: keyIntroductionInventory[1],
                  onTap: () => setState(() {
                    idSelected = 2;
                    inventory = false;
                    history = true;
                    checkIntroStockHistory(
                      keyIntroductionHistory,
                      context,
                      customPreferences,
                    );
                  }),
                  idSelected: idSelected,
                  index: 1,
                  title: "HISTORY",
                ),
              ],
            ),
          ),
          StockInventoryMenu(
            keyIntroduction: keyIntroductionInventory,
            inventory: inventory,
            warehouseBloc: warehouseBloc,
          ),
          StockHistoryMenu(
            keyIntroduction: keyIntroductionHistory,
            reportBloc: reportBloc,
            history: history,
          ),
        ],
      ),
    );
  }
}
