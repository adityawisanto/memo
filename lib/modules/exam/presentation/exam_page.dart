import 'package:memo/packages/packages.dart';

class ExamPage extends StatefulWidget {
  static const routeName = "/exam";

  final ExamArgument examArgument;

  const ExamPage({
    super.key,
    required this.examArgument,
  });

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final seenBloc = locator<SeenBloc>();

  late YoutubePlayerController youtubePlayerController;

  late Timer timer;

  bool? test = false;

  Future<void> initYoutube() async {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.examArgument.courseItem!.video.toString(),
      flags: const YoutubePlayerFlags(
        disableDragSeek: true,
        isLive: true,
        showLiveFullscreenButton: false,
      ),
    );

    enableTest();
  }

  Future<void> enableTest() async {
    await Future.delayed(
      const Duration(
        seconds: 10,
      ),
    );
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        final onStart = youtubePlayerController.value.position +
            const Duration(seconds: 10);
        final onTotal = youtubePlayerController.metadata.duration;
        if (onStart > onTotal) {
          test = true;
          timer.cancel();
        } else {
          test = false;
        }
      });
    });
  }

  @override
  void deactivate() {
    youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    seenBloc.close();

    youtubePlayerController.dispose();

    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    initYoutube();
    seenBloc.add(
      SeenSubmitted(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "Detail Modul",
        onTap: () => CustomNavigation.back(context),
      ),
      body: BlocListener(
        bloc: seenBloc,
        listener: (context, state) {},
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/ticket/calendar.svg",
                        colorFilter: ColorFilter.mode(
                          CustomColorStyle.grayPrimary,
                          BlendMode.srcIn,
                        ),
                        width: 12.w,
                        height: 12.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        CustomDate.formatDate(
                          widget.examArgument.courseItem!.published.toString(),
                        ),
                        style: CustomTextStyle.medium(
                          10.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: CustomColorStyle.redPrimary,
                        size: 14,
                      ),
                      SizedBox(
                        width: 4.h,
                      ),
                      Text(
                        CustomDate.getFormattedGoesToFrom(
                          DateTime.parse(
                            widget.examArgument.courseItem!.deadline.toString(),
                          ),
                        ),
                        style: CustomTextStyle.medium(
                          8.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                width: CustomSize.width(context),
                child: YoutubePlayer(
                  controller: youtubePlayerController,
                  progressIndicatorColor: CustomColorStyle.orangePrimary,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                widget.examArgument.courseItem!.title.toString(),
                style: CustomTextStyle.bold(
                  10.sp,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                widget.examArgument.courseItem!.description.toString(),
                style: CustomTextStyle.medium(
                  10.sp,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 12.h,
              ),
              widget.examArgument.courseItem!.status.toString() == "finish"
                  ? const SizedBox.shrink()
                  : Column(
                      children: [
                        Text(
                          "Yuk uji pengetahuanmu dengan post Test",
                          style: CustomTextStyle.bold(
                            10.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Setelah menonton modul, mari kita cek seberapa paham kamu terhadap materi ini. Ingat, modul ini tetap tersedia saat kamu mengerjakan post test. Ayo, semangat",
                          style: CustomTextStyle.medium(
                            10.sp,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          onPressed: test == false
                              ? null
                              : () => showModalBottomSheet(
                                    context: context,
                                    backgroundColor: CustomColorStyle.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          24,
                                        ),
                                        topRight: Radius.circular(
                                          24,
                                        ),
                                      ),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    builder: (context) => ExamDialog(
                                      examArgument: widget.examArgument,
                                    ),
                                  ),
                          label: "Mulai Latihan",
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
