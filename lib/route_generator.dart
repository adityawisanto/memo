import 'package:memo/packages/packages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case StockPage.routeName:
        return MaterialPageRoute(builder: (_) => const StockPage());
      case SummaryPage.routeName:
        return MaterialPageRoute(builder: (_) => const SummaryPage());
      case CourseSearchPage.routeName:
        return MaterialPageRoute(builder: (_) => const CourseSearchPage());
      case MerchantM3sPage.routeName:
        if (args is MerchantArgument) {
          return MaterialPageRoute(
            builder: (_) => MerchantM3sPage(
              merchantArgument: args,
            ),
          );
        }
        return notFoundPage();
      case GraduationPage.routeName:
        if (args is GraduationArgument) {
          return MaterialPageRoute(
            builder: (_) => GraduationPage(
              graduationArgument: args,
            ),
          );
        }
        return notFoundPage();
      case ExamPage.routeName:
        if (args is ExamArgument) {
          return MaterialPageRoute(
            builder: (_) => ExamPage(
              examArgument: args,
            ),
          );
        }
        return notFoundPage();
      case ModulPage.routeName:
        if (args is ModulArgument) {
          return MaterialPageRoute(
            builder: (_) => ModulPage(
              modulArgument: args,
            ),
          );
        }
        return notFoundPage();
      case DetailStockPage.routeName:
        if (args is InventoryArgument) {
          return MaterialPageRoute(
            builder: (_) => DetailStockPage(
              inventoryArgument: args,
            ),
          );
        }
        return notFoundPage();
      case LkmDonePage.routeName:
        if (args is LkmArgument) {
          return MaterialPageRoute(
            builder: (_) => LkmDonePage(
              lkmArgument: args,
            ),
          );
        }
        return notFoundPage();
      case LkmPendingPage.routeName:
        if (args is LkmArgument) {
          return MaterialPageRoute(
            builder: (_) => LkmPendingPage(
              lkmArgument: args,
            ),
          );
        }
        return notFoundPage();
      case MerchantPage.routeName:
        if (args is MerchantArgument) {
          return MaterialPageRoute(
            builder: (_) => MerchantPage(
              merchantArgument: args,
            ),
          );
        }
        return notFoundPage();
      case EvidencePage.routeName:
        if (args is EvidenceArgument) {
          return MaterialPageRoute(
            builder: (_) => EvidencePage(
              evidenceArgument: args,
            ),
          );
        }
        return notFoundPage();
      case SignaturePage.routeName:
        if (args is SignatureArgument) {
          return MaterialPageRoute(
            builder: (_) => SignaturePage(
              signatureArgument: args,
            ),
          );
        }
        return notFoundPage();
      case BundlePage.routeName:
        if (args is BundleArgument) {
          return MaterialPageRoute(
            builder: (_) => BundlePage(
              bundleArgument: args,
            ),
          );
        }
        return notFoundPage();
      default:
        return notFoundPage();
    }
  }

  static Route<dynamic> notFoundPage() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(
              "Page Not found",
            ),
          ),
        );
      },
    );
  }
}
