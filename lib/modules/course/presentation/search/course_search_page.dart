import 'package:memo/packages/packages.dart';

class CourseSearchPage extends StatefulWidget {
  static const routeName = "/course/search";

  const CourseSearchPage({super.key});

  @override
  State<CourseSearchPage> createState() => _CourseSearchPageState();
}

class _CourseSearchPageState extends State<CourseSearchPage> {
  final search = TextEditingController();
  final courseBloc = locator<CourseBloc>();
  final assignBloc = locator<AssignBloc>();

  @override
  void dispose() {
    search.clear();
    courseBloc.close();
    assignBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    courseBloc.add(
      const CourseSearched(
        title: "",
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "Search Course",
        onTap: () => CustomNavigation.back(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                color: CustomColorStyle.white,
              ),
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 20,
                    color: CustomColorStyle.redPrimary,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: search,
                      keyboardType: TextInputType.name,
                      cursorColor: CustomColorStyle.orangePrimary,
                      style: CustomTextStyle.medium(
                        10.sp,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Modul",
                        hintStyle: CustomTextStyle.medium(
                          10.sp,
                          color: CustomColorStyle.grayPrimary.withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        courseBloc.add(
                          CourseSearched(
                            title: value,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: BlocBuilder(
                bloc: courseBloc,
                builder: (context, state) {
                  if (state is CourseLoading) {
                    debugPrint("loading...");
                  } else if (state is CourseSearchSuccess) {
                    if (state.dataCourse.courseItem!.isEmpty) {
                      return CustomHandler.empty();
                    }
                    return ListView.builder(
                      itemCount: state.dataCourse.courseItem!.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ModulItem(
                          courseItem: state.dataCourse.courseItem![index],
                          assignBloc: assignBloc,
                        );
                      },
                    );
                  } else if (state is CourseFailure) {
                    CustomToast.failure(state.message);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
