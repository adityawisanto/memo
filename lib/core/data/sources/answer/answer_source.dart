import 'package:memo/packages/packages.dart';

abstract class AnswerSource {
  Future<AnswerModel> postCurrentAnswer(
    int? idCourse,
    String? answers,
  );
}

class AnswerSourceImpl implements AnswerSource {
  final Dio dio;

  AnswerSourceImpl({
    required this.dio,
  });

  @override
  Future<AnswerModel> postCurrentAnswer(
    int? idCourse,
    String? answers,
  ) async {
    try {
      final response = await dio.post(
        CustomEnv().env(
          "SUBMIT_ANSWER",
        ),
        data: {
          "course_id": idCourse,
          "answers": json.decode(answers.toString()),
        },
      );

      return AnswerModel.fromJson(
        response.data,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
