enum AppRouter {
  home,
  counter,
  dialog,
  todo,
}

extension AppRouterExtension on AppRouter {
  String get path {
    switch (this) {
      /// e.g. Dynamic Path Pattern
      ///
      /// case Enums:
      ///   return id != null ? '/user/$id' : '/user/:id';
      case AppRouter.home:
        return '/';
      case AppRouter.counter:
        return '/counter';
      case AppRouter.dialog:
        return '/dialog';
      case AppRouter.todo:
        return '/todo';
    }
  }

  String get name => toString().split('.').last;
}
