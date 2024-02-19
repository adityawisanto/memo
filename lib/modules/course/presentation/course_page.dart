import 'package:memo/packages/packages.dart';

class CoursePage extends StatefulWidget {
  static const routeName = "/course";

  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final courseBloc = locator<CourseBloc>();
  final customPreferences = locator<CustomPreferences>();

  List<CourseItem> listWaching = [];
  List<CourseItem> listPostTest = [];

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void dispose() {
    courseBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    courseBloc.add(
      CourseGetted(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "COURSE",
        centerTitle: false,
        automaticallyImplyLeading: false,
        colorText: CustomColorStyle.redPrimary,
        withSearch: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder(
          bloc: courseBloc,
          builder: (context, state) {
            if (state is CourseLoading) {
              return const CourseShimmer();
            } else if (state is CourseGetSuccess) {
              final data = state.course.data!;
              listWaching.clear();
              listPostTest.clear();
              for (var i in data) {
                final course = i.courseItem!
                    .where(
                      (e) => e.id == i.id,
                    )
                    .toList();

                final watch =
                    course.where((e) => e.status == "watching").toList();

                final postTest =
                    course.where((e) => e.status == "post test").toList();

                for (var j in watch) {
                  listWaching.add(j);
                }

                for (var j in postTest) {
                  listPostTest.add(j);
                }
              }
              checkIntroCourse(
                keyIntroduction,
                context,
                customPreferences,
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      "Halo, MERi\nYuk mulai belajar lagi dan kumpulkan point sebanyak - banyaknya",
                      style: CustomTextStyle.regular(
                        10.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: CourseLearning(
                      keyIntroduction: keyIntroduction,
                      data: data,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  listWaching.isNotEmpty
                      ? CourseContinueItem(
                          courseItem: listWaching,
                          title: "Continue Waiting",
                        )
                      : const SizedBox.shrink(),
                  listPostTest.isNotEmpty
                      ? CourseContinueItem(
                          courseItem: listPostTest,
                          title: "Continue Post Test",
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      "Category",
                      style: CustomTextStyle.bold(
                        12.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  state.course.data!.isEmpty
                      ? CustomHandler.empty()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          primary: true,
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 30,
                          ),
                          itemCount: state.course.data!.length,
                          itemBuilder: (context, index) {
                            return CourseCategoryItem(
                              key: index == 0 ? keyIntroduction[1] : null,
                              dataCourse: state.course.data![index],
                            );
                          },
                        ),
                ],
              );
            } else if (state is CourseFailure) {
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
