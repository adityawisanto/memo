import 'package:memo/packages/packages.dart';

abstract class ExamSource {
  Future<ExamModel> getCurrentExam(
    String? id,
  );
}

class ExamSourceImpl implements ExamSource {
  final Dio dio;

  const ExamSourceImpl({
    required this.dio,
  });

  @override
  Future<ExamModel> getCurrentExam(String? id) async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          "${CustomEnv().env("COURSE_GET")}/$id",
        );

        await ExamTable().truncateExam();

        final data = response.data["data"];
        final problem = data["problems"];

        if (problem.isNotEmpty) {
          for (int i = 0; i < problem.length; i++) {
            List<ExamItemModel> examItem = [];

            final problems = problem[i]["answers"];

            if (problems.isNotEmpty) {
              for (int j = 0; j < problems.length; j++) {
                final answer = problems[j];

                final examItemModel = ExamItemModel(
                  id: problem[i]["ID"],
                  idExam: answer["ID"],
                  answer: answer["text"],
                );

                examItem.add(examItemModel);
              }
            }

            final dataExamModel = DataExamModel(
              id: problem[i]["ID"],
              idCourse: problem[i]["course_id"],
              question: problem[i]["question"],
              examItem: examItem,
              correct: "",
            );

            await ExamTable().createExam(dataExamModel);
          }
        }

        return await ExamTable().getExam();
      } else {
        return await ExamTable().getExam();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
