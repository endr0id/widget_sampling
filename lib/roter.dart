import 'package:go_router/go_router.dart';
import 'package:widget_sampling/features/counter/presentation/view/counter.dart';
import 'package:widget_sampling/features/dialog/presentation/view/dialog.dart';
import 'package:widget_sampling/features/home/presentation/view/home.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(title: 'Home'),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const Counter(title: 'Counter'),
    ),
    GoRoute(
      path: '/dialog',
      builder: (context, state) => const Dialog(title: 'Dialog'),
    )
  ],
);