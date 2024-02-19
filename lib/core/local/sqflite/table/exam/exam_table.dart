import 'package:memo/packages/packages.dart';

const String examTable = "exam";
const String examItemTable = "examitem";

class ExamTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createExamTable(Database db) async {
    const id = "INT";
    const idExam = "INT";
    const idCourse = "INT";
    const question = "TEXT";
    const answer = "TEXT";
    const correct = "TEXT";

    await db.execute(
      "CREATE TABLE $examTable (id $id, id_course $idCourse, question $question, correct $correct)",
    );

    await db.execute(
      "CREATE TABLE $examItemTable (id $id, id_exam $idExam, answer $answer)",
    );
  }

  Future<int> createExam(
    DataExamModel dataExamModel,
  ) async {
    final db = await customSqflite.database;

    for (var examItem in dataExamModel.examItem!) {
      createExamItem(
        ExamItemModel(
          id: examItem.id,
          idExam: examItem.idExam,
          answer: examItem.answer,
        ),
      );
    }

    return await db.insert(
      examTable,
      dataExamModel.toJson(),
    );
  }

  Future<int> createExamItem(
    ExamItemModel examItemModel,
  ) async {
    final db = await customSqflite.database;
    return await db.insert(
      examItemTable,
      examItemModel.toJson(),
    );
  }

  Future<ExamModel> getExam() async {
    final db = await customSqflite.database;

    final exam = await db.query(examTable);
    final examItem = await db.query(examItemTable);

    return ExamModel(
      data: exam
          .map(
            (e) => DataExamModel.fromJson(
              e,
              examItem
                  .map(
                    (e) => ExamItemModel.fromJson(
                      e,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  Future<void> truncateExam() async {
    final db = await customSqflite.database;
    await db.delete(examTable);
    await db.delete(examItemTable);
  }
}
