import 'package:memo/packages/packages.dart';

class CourseLearning extends StatelessWidget {
  final List<GlobalKey> keyIntroduction;
  final List<DataCourse> data;

  const CourseLearning({
    super.key,
    required this.keyIntroduction,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    int totalScore = 0;
    int totalDone = 0;
    for (var item in data) {
      totalScore += item.score!;
      totalDone += item.done!;
    }
    return Row(
      children: [
        CourseLearningItem(
          key: keyIntroduction[2],
          title: "TOTAL POINT",
          url: "assets/images/course/point.svg",
          description: "$totalScore",
        ),
        SizedBox(
          width: 16.w,
        ),
        CourseLearningItem(
          key: keyIntroduction[0],
          title: "MODUL",
          url: "assets/images/course/modul.svg",
          description: "$totalDone/${data.length}",
        ),
      ],
    );
  }
}
