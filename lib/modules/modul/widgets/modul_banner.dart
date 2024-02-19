import 'package:memo/packages/packages.dart';

class ModulBanner extends StatelessWidget {
  final ModulArgument modulArgument;

  const ModulBanner({
    super.key,
    required this.modulArgument,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: CustomSize.width(context),
          margin: const EdgeInsets.only(
            top: 24,
          ),
          padding: const EdgeInsets.only(
            left: 70,
            top: 20,
            right: 20,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: modulArgument.dataCourse!.name.toString().toLowerCase() ==
                      "personalize"
                  ? [
                      CustomColorStyle.redPrimary,
                      CustomColorStyle.redPrimary.withOpacity(0.8),
                    ]
                  : modulArgument.dataCourse!.name.toString().toLowerCase() ==
                          "purchase"
                      ? [
                          CustomColorStyle.greenPrimary,
                          CustomColorStyle.greenPrimary.withOpacity(0.8),
                        ]
                      : modulArgument.dataCourse!.name
                                  .toString()
                                  .toLowerCase() ==
                              "brizzi"
                          ? [
                              CustomColorStyle.bluePrimary,
                              CustomColorStyle.bluePrimary.withOpacity(0.6),
                            ]
                          : modulArgument.dataCourse!.name
                                      .toString()
                                      .toLowerCase() ==
                                  "qris"
                              ? [
                                  CustomColorStyle.purplePrimary,
                                  CustomColorStyle.purplePrimary
                                      .withOpacity(0.6),
                                ]
                              : [
                                  CustomColorStyle.redPrimary,
                                  CustomColorStyle.redPrimary.withOpacity(0.8),
                                ],
            ),
          ),
          child: Text(
            modulArgument.dataCourse!.description.toString(),
            style: CustomTextStyle.medium(
              10.sp,
              color: CustomColorStyle.white,
            ),
          ),
        ),
        Positioned(
          left: 8,
          child: Image.network(
            modulArgument.dataCourse!.image.toString(),
            width: 50.w,
            height: 50.h,
          ),
        ),
      ],
    );
  }
}
