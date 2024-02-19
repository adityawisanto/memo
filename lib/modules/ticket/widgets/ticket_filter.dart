import 'package:memo/packages/packages.dart';

class TicketFilter extends StatefulWidget {
  final List<String> selectedChip;
  final List<String> listAllStatus;
  final List<String> listAllJenis;
  final List<String> listAllSLA;
  final List<String> listAllPrio;
  final void Function()? onPressed;

  const TicketFilter({
    super.key,
    required this.selectedChip,
    required this.listAllStatus,
    required this.listAllJenis,
    required this.listAllSLA,
    required this.listAllPrio,
    required this.onPressed,
  });

  @override
  State<TicketFilter> createState() => _TicketFilterState();
}

class _TicketFilterState extends State<TicketFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              widget.selectedChip.clear();
              CustomNavigation.back(context);
            }),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Reset",
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.orangePrimary,
                ),
              ),
            ),
          ),
          Text(
            "Status Tiket",
            style: CustomTextStyle.bold(
              10.sp,
              color: CustomColorStyle.orangePrimary,
            ),
          ),
          Wrap(
            spacing: 8,
            children: widget.listAllStatus.map((e) {
              return TicketFilterChip(
                title: e,
                selectedChip: widget.selectedChip,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      widget.selectedChip.add(
                        e,
                      );
                    } else {
                      widget.selectedChip.remove(
                        e,
                      );
                    }
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Jenis Ticket",
            style: CustomTextStyle.bold(
              10.sp,
              color: CustomColorStyle.orangePrimary,
            ),
          ),
          Wrap(
            spacing: 8,
            children: widget.listAllJenis.map((e) {
              return TicketFilterChip(
                title: e,
                selectedChip: widget.selectedChip,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      widget.selectedChip.add(
                        e,
                      );
                    } else {
                      widget.selectedChip.remove(
                        e,
                      );
                    }
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "SLA",
            style: CustomTextStyle.bold(
              10.sp,
              color: CustomColorStyle.orangePrimary,
            ),
          ),
          Wrap(
            spacing: 8,
            children: widget.listAllSLA.map((e) {
              return TicketFilterChip(
                title: e,
                selectedChip: widget.selectedChip,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      widget.selectedChip.add(
                        e,
                      );
                    } else {
                      widget.selectedChip.remove(
                        e,
                      );
                    }
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Prioritas",
            style: CustomTextStyle.bold(
              10.sp,
              color: CustomColorStyle.orangePrimary,
            ),
          ),
          Wrap(
            spacing: 8,
            children: widget.listAllPrio.map((e) {
              return TicketFilterChip(
                title: e,
                selectedChip: widget.selectedChip,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      widget.selectedChip.add(
                        e,
                      );
                    } else {
                      widget.selectedChip.remove(
                        e,
                      );
                    }
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 16.h,
          ),
          ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColorStyle.orangePrimary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
            ),
            child: Text(
              "Filter",
              style: CustomTextStyle.bold(
                12.sp,
                color: CustomColorStyle.white,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
