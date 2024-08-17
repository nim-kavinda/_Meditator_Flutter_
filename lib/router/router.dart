import 'package:go_router/go_router.dart';
import 'package:meditor/pages/main_screen.dart';
import 'package:meditor/router/route_name.dart';

class RouterClass {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.home,
        builder: (context, state) {
          return MainScreen();
        },
      ),
    ],
  );
}
