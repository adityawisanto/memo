import 'package:memo/packages/packages.dart';

abstract class CourseSource {
  Future<CourseModel> getCurrentCourse();
  Future<DataCourseModel> searchCurrentCourse(
    String? title,
  );
}

class CourseSourceImpl implements CourseSource {
  final Dio dio;

  CourseSourceImpl({
    required this.dio,
  });

  @override
  Future<CourseModel> getCurrentCourse() async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          CustomEnv().env("COURSE_GET"),
        );

        await CourseTable().truncateCourse();

        final data = response.data["data"];

        if (data != null) {
          for (int i = 0; i < data.length; i++) {
            final List<CourseItemModel> courseItem = [];

            final assignedCourses = data[i]["AssignedCourses"];

            for (int j = 0; j < assignedCourses.length; j++) {
              final courses = assignedCourses[j];

              final courseItemModel = CourseItemModel(
                id: data[i]["ID"],
                idAssign: courses["ID"],
                idCourse: courses["Course"]["ID"],
                title: courses["Course"]["name"],
                description: courses["Course"]["course_material"],
                duration: courses["Course"]["duration"],
                deadline: courses["deadline"],
                published: courses["published_date"],
                status: courses["status"],
                thumbnail: courses["Course"]["thumbnail"],
                video: courses["Course"]["video"],
                score: courses["score"],
              );

              courseItem.add(courseItemModel);

              await CourseTable().createCourseItem(courseItemModel);
            }

            final courseCount =
                courseItem.where((e) => e.status == "finish").length;

            double percentage = (courseCount / courseItem.length * 100).isNaN
                ? 0.0
                : (courseCount / courseItem.length * 100);

            String status =
                courseItem.any((e) => e.status == "open") ? "open" : "old";

            int score = 0;
            for (var item in courseItem) {
              score += item.score!;
            }

            final dataCourseModel = DataCourseModel(
              id: data[i]["ID"],
              image: data[i]["Image"],
              name: data[i]["Name"],
              description: data[i]["Details"],
              modul: data[i]["AssignedCourses"].length,
              total: courseItem.length,
              percentage: percentage.toInt(),
              done: courseCount,
              score: score,
              status: status,
              courseItem: null,
            );

            await CourseTable().createCourse(dataCourseModel);
          }
        }

        return await CourseTable().getCourse();
      } else {
        return await CourseTable().getCourse();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }

  @override
  Future<DataCourseModel> searchCurrentCourse(
    String? title,
  ) async {
    try {
      return await CourseTable().searchCourse(
        title,
      );
    } catch (e) {
      throw const ServerException("Another Failure");
    }
  }
}
