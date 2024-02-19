import 'package:memo/packages/packages.dart';

class ModulArgument extends Equatable {
  final DataCourse? dataCourse;

  const ModulArgument({
    required this.dataCourse,
  });

  @override
  List<Object?> get props => [
        dataCourse,
      ];
}
