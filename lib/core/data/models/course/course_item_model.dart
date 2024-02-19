import 'package:memo/packages/packages.dart';

class CourseItemModel extends Equatable {
  final int? id;
  final int? idAssign;
  final int? idCourse;
  final String? title;
  final String? description;
  final String? duration;
  final String? deadline;
  final String? published;
  final String? status;
  final String? thumbnail;
  final String? video;
  final int? score;

  const CourseItemModel({
    required this.id,
    required this.idAssign,
    required this.idCourse,
    required this.title,
    required this.description,
    required this.duration,
    required this.deadline,
    required this.published,
    required this.status,
    required this.thumbnail,
    required this.video,
    required this.score,
  });

  factory CourseItemModel.fromJson(Map<String, dynamic> json) {
    return CourseItemModel(
      id: json["id"],
      idAssign: json["id_assign"],
      idCourse: json["id_course"],
      title: json["title"],
      description: json["description"],
      duration: json["duration"],
      deadline: json["deadline"],
      published: json["published"],
      status: json["status"],
      thumbnail: json["thumbnail"],
      video: json["video"],
      score: json["score"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_assign": idAssign,
        "id_course": idCourse,
        "title": title,
        "description": description,
        "duration": duration,
        "deadline": deadline,
        "published": published,
        "status": status,
        "thumbnail": thumbnail,
        "video": video,
        "score": score,
      };

  CourseItem toEntity() => CourseItem(
        id: id,
        idAssign: idAssign,
        idCourse: idCourse,
        title: title,
        description: description,
        duration: duration,
        deadline: deadline,
        published: published,
        status: status,
        thumbnail: thumbnail,
        video: video,
        score: score,
      );

  @override
  List<Object?> get props => [
        id,
        idAssign,
        idCourse,
        title,
        description,
        duration,
        deadline,
        published,
        status,
        thumbnail,
        video,
        score,
      ];
}
