import 'package:memo/packages/packages.dart';

class StockInventoryShimmer extends StatelessWidget {
  const StockInventoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 8,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: 9,
      itemBuilder: (context, index) {
        return CustomCard(
          withBorder: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomShimmer(
                width: 50,
                height: 50,
                borderRadius: 8,
              ),
              SizedBox(
                height: 6.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context) / 6,
                height: 12,
                borderRadius: 8,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context) / 16,
                height: 12,
                borderRadius: 8,
              )
            ],
          ),
        );
      },
    );
  }
}
