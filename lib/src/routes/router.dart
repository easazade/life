import 'package:auto_route/auto_route.dart';
import 'package:life/src/features/attract/wish/attract_wish_screen.dart';
import 'package:life/src/features/change/within/change_within_screen.dart';
import 'package:life/src/features/feel/good/feel_good_now_screen.dart';
import 'package:life/src/features/home/home_screen.dart';
import 'package:life/src/features/treeview/treeview_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: 'home', page: HomeScreen),
    AutoRoute(path: 'treeview', page: TreeViewScreen),
    AutoRoute(path: 'feel-good-now', page: FeelGoodNowScreen),
    AutoRoute(path: 'change-within', page: ChangeWithinScreen),
    AutoRoute(path: 'attract-wish', page: AttractWishScreen),
  ],
)
class $Liferouter {}
