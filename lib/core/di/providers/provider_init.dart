import 'package:memo/packages/packages.dart';

class ProviderInit {
  MultiBlocProvider provider({
    required Widget? child,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<AnswerBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<AssignBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<AuditBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<BundleBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<CheckBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<CourseBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<ExamBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<InventoryBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<LkmBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<LocationBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<LoginBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<ReportBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<SallaryBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<SeenBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<StatusBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<SummaryBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<TicketBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<UserBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<WarehouseBloc>(),
        ),
      ],
      child: child!,
    );
  }
}
