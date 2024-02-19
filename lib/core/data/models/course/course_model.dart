import 'package:memo/packages/packages.dart';

class CourseModel extends Equatable {
  final List<DataCourseModel>? data;

  const CourseModel({
    required this.data,
  });

  factory CourseModel.fromJson(
    Map<String, dynamic> json,
    List<CourseItemModel>? courseItem,
  ) {
    return CourseModel(
      data: List<DataCourseModel>.from(
        json["data"].map(
          (x) => DataCourseModel.fromJson(
            x,
            courseItem,
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Course toEntity() => Course(
        data: data!
            .map(
              (e) => DataCourse(
                id: e.id,
                image: e.image,
                name: e.name,
                description: e.description,
                modul: e.modul,
                total: e.total,
                percentage: e.percentage,
                done: e.done,
                score: e.score,
                status: e.status,
                courseItem: e.courseItem!
                    .map(
                      (e) => CourseItem(
                        id: e.id,
                        idAssign: e.idAssign,
                        idCourse: e.idCourse,
                        title: e.title,
                        description: e.description,
                        duration: e.duration,
                        deadline: e.deadline,
                        published: e.published,
                        status: e.status,
                        thumbnail: e.thumbnail,
                        video: e.video,
                        score: e.score,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
