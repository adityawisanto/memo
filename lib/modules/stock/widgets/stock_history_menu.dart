import 'package:memo/packages/packages.dart';

class StockHistoryMenu extends StatelessWidget {
  final List<GlobalKey> keyIntroduction;
  final ReportBloc reportBloc;
  final bool history;

  const StockHistoryMenu({
    super.key,
    required this.keyIntroduction,
    required this.reportBloc,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: history,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: BlocBuilder(
            bloc: reportBloc,
            builder: (context, state) {
              if (state is ReportLoading) {
                return const StockHistoryShimmer();
              } else if (state is ReportGetSuccess) {
                if (state.report.data!.isEmpty) {
                  return CustomHandler.empty();
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    bottom: 50,
                  ),
                  itemCount: state.report.data!.length,
                  itemBuilder: (context, index) {
                    return StockHistoryItem(
                      key: index == 0 ? keyIntroduction[0] : null,
                      dataReport: state.report.data![index],
                    );
                  },
                );
              } else if (state is ReportFailure) {
                CustomToast.failure(
                  state.message,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
