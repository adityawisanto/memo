import 'package:memo/packages/packages.dart';

class CourseItem extends Equatable {
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

  const CourseItem({
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
