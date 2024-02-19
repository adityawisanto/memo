import 'package:memo/packages/packages.dart';

class CustomNavigation {
  static back(BuildContext context) {
    Navigator.pop(
      context,
    );
  }

  static intent(BuildContext context, String nameRouted) {
    Navigator.pushNamed(context, nameRouted);
  }

  static intentWithData(
      BuildContext context, String nameRouted, Object arguments) {
    Navigator.pushNamed(
      context,
      nameRouted,
      arguments: arguments,
    );
  }

  static intentWithClearAllRoutes(
    BuildContext context,
    String nameRouted, {
    Object? arguments,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      nameRouted,
      (route) => false,
      arguments: arguments,
    );
  }
}
