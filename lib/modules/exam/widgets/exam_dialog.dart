import 'package:memo/packages/packages.dart';

class ExamDialog extends StatefulWidget {
  final ExamArgument examArgument;

  const ExamDialog({
    super.key,
    required this.examArgument,
  });

  @override
  State<ExamDialog> createState() => _ExamDialogState();
}

class _ExamDialogState extends State<ExamDialog> {
  final examBloc = locator<ExamBloc>();
  final answerBloc = locator<AnswerBloc>();
  final assignBloc = locator<AssignBloc>();

  List<DataExam>? dataExam = [];

  bool isEnabled = false;

  @override
  void dispose() {
    examBloc.close();
    answerBloc.close();
    assignBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    examBloc.add(
      ExamGetted(
        id: widget.examArgument.courseItem!.idCourse.toString(),
      ),
    );
    assignBloc.add(
      AssignSubmitted(
        idAssign: widget.examArgument.courseItem!.idAssign,
        status: "post test",
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "Post Test",
        onTap: () => CustomNavigation.back(context),
      ),
      body: BlocListener(
        bloc: answerBloc,
        listener: (context, state) {
          if (state is AnswerLoading) {
            CustomNavigation.back(context);
            CustomDialog().loading(
              "Proses mengirim quiz...",
            );
          } else if (state is AnswerPostSuccess) {
            CustomNavigation.back(context);
            assignBloc.add(
              AssignSubmitted(
                idAssign: widget.examArgument.courseItem!.idAssign,
                status: "finish",
              ),
            );
            CustomNavigation.intentWithClearAllRoutes(
              context,
              GraduationPage.routeName,
              arguments: GraduationArgument(
                dataAnswer: state.answer.data,
                total: dataExam!.length,
              ),
            );
          } else if (state is AnswerFailure) {}
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExamNotes(),
              SizedBox(
                height: 6.h,
              ),
              BlocBuilder(
                bloc: examBloc,
                builder: (context, state) {
                  if (state is ExamLoading) {
                    debugPrint("loading...");
                  } else if (state is ExamGetSuccess) {
                    dataExam = state.exam.data;
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          itemCount: dataExam!.length,
                          itemBuilder: (context, index) {
                            final exam = dataExam![index];
                            final examItem = exam.examItem!
                                .where(
                                  (e) => e.id == exam.id,
                                )
                                .toList();
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pertanyaan ${index + 1} :",
                                  style: CustomTextStyle.bold(
                                    10.sp,
                                  ),
                                ),
                                Text(
                                  exam.question.toString(),
                                  style: CustomTextStyle.regular(
                                    10.sp,
                                  ),
                                ),
                                ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: examItem.length,
                                  itemBuilder: (context, index) {
                                    String alphabetLetter = String.fromCharCode(
                                      'A'.codeUnitAt(0) + index,
                                    );
                                    return GestureDetector(
                                      onTap: () => setState(() {
                                        exam.correct =
                                            examItem[index].idExam.toString();
                                        if (isExamComplete()) {
                                          isEnabled = false;
                                        } else {
                                          isEnabled = true;
                                        }
                                      }),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                          color: exam.correct ==
                                                  examItem[index]
                                                      .idExam
                                                      .toString()
                                              ? CustomColorStyle.orangePrimary
                                              : CustomColorStyle.white,
                                        ),
                                        child: Text(
                                          "$alphabetLetter. ${examItem[index].answer.toString()}",
                                          style: CustomTextStyle.medium(
                                            10.sp,
                                            color: exam.correct ==
                                                    examItem[index]
                                                        .idExam
                                                        .toString()
                                                ? CustomColorStyle.white
                                                : CustomColorStyle.blackPrimary,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              child: CustomButton(
                                backgroundColor: CustomColorStyle.white,
                                fontColor: CustomColorStyle.orangePrimary,
                                onPressed: () => CustomDialog().information(
                                  "Perhatian",
                                  "Yakin ingin menghapus jawaban?",
                                  no: "Tidak",
                                  negative: () =>
                                      CustomNavigation.back(context),
                                  yes: "Ya",
                                  positive: () async => setState(() {
                                    for (var item in state.exam.data!) {
                                      item.correct = "";
                                      isEnabled = false;
                                    }
                                    CustomNavigation.back(context);
                                  }),
                                  backgroundPositive: CustomColorStyle.white,
                                  colorTextPositive:
                                      CustomColorStyle.orangePrimary,
                                ),
                                label: "Reset",
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: CustomButton(
                                onPressed: isEnabled == false
                                    ? null
                                    : () => CustomDialog().information(
                                          "Perhatian",
                                          "Yakin dengan jawabanmu?",
                                          no: "Tidak",
                                          negative: () =>
                                              CustomNavigation.back(context),
                                          yes: "Ya",
                                          positive: () {
                                            List<String> listData = [];
                                            listData.clear();
                                            for (var item in dataExam!) {
                                              final data = {
                                                "problem_id": item.id!,
                                                "answer_id": int.parse(
                                                  item.correct.toString(),
                                                ),
                                              };
                                              listData.add(
                                                json.encode(
                                                  data,
                                                ),
                                              );
                                            }

                                            answerBloc.add(
                                              AnswerSubmitted(
                                                idCourse: widget.examArgument
                                                    .courseItem!.idCourse,
                                                answers: listData.toString(),
                                              ),
                                            );
                                          },
                                          backgroundNegative:
                                              CustomColorStyle.white,
                                          colorTextNegative:
                                              CustomColorStyle.orangePrimary,
                                        ),
                                label: "Submit",
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (state is ExamFailure) {}
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isExamComplete() {
    for (var item in dataExam!) {
      if (item.correct!.isEmpty) {
        return true;
      }
    }
    return false;
  }
}
