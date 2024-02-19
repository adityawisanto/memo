import 'package:memo/packages/packages.dart';

class StockInventoryMenu extends StatelessWidget {
  final List<GlobalKey> keyIntroduction;
  final WarehouseBloc warehouseBloc;
  final bool inventory;

  const StockInventoryMenu({
    super.key,
    required this.keyIntroduction,
    required this.warehouseBloc,
    required this.inventory,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: inventory,
      child: Expanded(
        child: BlocBuilder(
          bloc: warehouseBloc,
          builder: (context, state) {
            if (state is WarehouseLoading) {
              return const StockInventoryShimmer();
            } else if (state is WarehouseGetSuccess) {
              if (state.warehouse.data!.isEmpty) {
                return CustomHandler.empty();
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 600
                      ? 3
                      : MediaQuery.of(context).size.width < 1025
                          ? 5
                          : 8,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                ),
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 50,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: state.warehouse.data!.length,
                itemBuilder: (context, index) {
                  return StockInventoryItem(
                    key: index == 0 ? keyIntroduction[2] : null,
                    dataWarehouse: state.warehouse.data![index],
                  );
                },
              );
            } else if (state is WarehouseFailure) {
              CustomToast.failure(
                state.message,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
