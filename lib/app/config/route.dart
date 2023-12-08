import 'package:employee_test/app/features/presentation/pages/create-user/create_user.dart';
import 'package:employee_test/app/features/presentation/pages/detail-user/detail_user_page.dart';
import 'package:employee_test/app/features/presentation/pages/home/home_page.dart';
import 'package:employee_test/app/features/presentation/pages/login/login_page.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const login = "/login";
  static const home = "/home";
  static const create_user = "create-user";
  static const detail_user = "detail-user";
}

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: Routes.create_user,
          name: Routes.create_user,
          builder: (context, state) => const CreateUser(),
        ),
        GoRoute(
          path: Routes.detail_user,
          name: Routes.detail_user,
          builder: (context, state) {
            final id = state.extra as int;
            return DetailUserPage(id: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
  ],
  initialLocation: Routes.login,
  debugLogDiagnostics: true,
);
