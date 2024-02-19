import 'package:memo/packages/packages.dart';

const String courseTable = "course";
const String courseItemTable = "courseitem";

class CourseTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createCourseTable(Database db) async {
    const id = "INT";
    const idAssign = "INT";
    const idCourse = "INT";
    const image = "TEXT";
    const name = "TEXT";
    const description = "TEXT";
    const modul = "INT";
    const total = "INT";
    const percentage = "INT";
    const done = "INT";
    const title = "TEXT";
    const courseMaterial = "TEXT";
    const duration = "TEXT";
    const deadline = "TEXT";
    const published = "TEXT";
    const status = "TEXT";
    const thumbnail = "TEXT";
    const video = "TEXT";
    const score = "INT";

    await db.execute(
      "CREATE TABLE $courseTable (id $id, image $image, name $name, description $description, modul $modul, total $total, percentage $percentage, done $done, status $status, score $score)",
    );

    await db.execute(
      "CREATE TABLE $courseItemTable (id $id, id_assign $idAssign, id_course $idCourse, title $title, description $courseMaterial, duration $duration, deadline $deadline, published $published, status $status, thumbnail $thumbnail, video $video, score $score)",
    );
  }

  Future<int> createCourse(
    DataCourseModel dataCourseModel,
  ) async {
    final db = await customSqflite.database;

    return await db.insert(
      courseTable,
      dataCourseModel.toJson(),
    );
  }

  Future<int> createCourseItem(
    CourseItemModel courseItemModel,
  ) async {
    final db = await customSqflite.database;

    return await db.insert(
      courseItemTable,
      courseItemModel.toJson(),
    );
  }

  Future<DataCourseModel> searchCourse(String? title) async {
    final db = await customSqflite.database;
    final result = await db.query(courseItemTable,
        where: "title LIKE ?",
        orderBy: "id_assign DESC",
        whereArgs: ["%$title%"]);

    return DataCourseModel(
        id: null,
        image: null,
        name: null,
        description: null,
        modul: null,
        total: null,
        percentage: null,
        done: null,
        score: null,
        status: null,
        courseItem: result
            .map(
              (e) => CourseItemModel.fromJson(
                e,
              ),
            )
            .toList());
  }

  Future<CourseModel> getCourse() async {
    final db = await customSqflite.database;

    final List<Map<String, dynamic>> course = await db.query(
      courseTable,
    );

    final List<Map<String, dynamic>> courseItem = await db.query(
      courseItemTable,
    );

    return CourseModel(
      data: course
          .map(
            (e) => DataCourseModel.fromJson(
              e,
              courseItem
                  .map(
                    (e) => CourseItemModel.fromJson(
                      e,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  Future<void> truncateCourse() async {
    final db = await customSqflite.database;
    await db.delete(courseTable);
    await db.delete(courseItemTable);
  }
}
