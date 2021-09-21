import 'package:auto_route/auto_route.dart';
import 'package:life/src/features/home/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: 'home', page: HomeScreen),
  ],
)
class $Liferouter {}
