import 'package:memo/packages/packages.dart';

class DataCourse extends Equatable {
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
  final List<CourseItem>? courseItem;

  const DataCourse({
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
        courseItem,
      ];
}
