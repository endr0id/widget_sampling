import 'package:go_router/go_router.dart';
import 'package:widget_sampling/features/counter/presentation/view/counter.dart';
import 'package:widget_sampling/features/dialog/presentation/view/dialog.dart';
import 'package:widget_sampling/features/home/presentation/view/home.dart';
import 'package:widget_sampling/core/constants/router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRouter.home.path,
      builder: (context, state) => const Home(title: 'Home'),
    ),
    GoRoute(
      path: AppRouter.counter.path,
      builder: (context, state) => const Counter(title: 'Counter'),
    ),
    GoRoute(
      path: AppRouter.dialog.path,
      builder: (context, state) => const Dialog(title: 'Dialog'),
    )
  ],
);