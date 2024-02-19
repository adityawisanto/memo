import 'package:memo/packages/packages.dart';

class DataCourseModel extends Equatable {
  final int? id;
  final String? image;
  final String? name;
  final String? description;
  final int? modul;
  final int? total;
  final int? percentage;
  final int? done;
  final int? score;
  final String? status;
  final List<CourseItemModel>? courseItem;

  const DataCourseModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.modul,
    required this.total,
    required this.percentage,
    required this.done,
    required this.score,
    required this.status,
    required this.courseItem,
  });

  factory DataCourseModel.fromJson(
    Map<String, dynamic> json,
    List<CourseItemModel>? courseItem,
  ) {
    return DataCourseModel(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      description: json["description"],
      modul: json["modul"],
      total: json["total"],
      percentage: json["percentage"],
      done: json["done"],
      score: json["score"],
      status: json["status"],
      courseItem: courseItem,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "description": description,
        "modul": modul,
        "total": total,
        "percentage": percentage,
        "done": done,
        "score": score,
        "status": status,
      };

  DataCourse toEntity() => DataCourse(
        id: id,
        image: image,
        name: name,
        description: description,
        modul: modul,
        total: total,
        percentage: percentage,
        done: done,
        score: score,
        status: status,
        courseItem: courseItem!
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
      );

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        description,
        modul,
        total,
        percentage,
        done,
        score,
        status,
      ];
}
