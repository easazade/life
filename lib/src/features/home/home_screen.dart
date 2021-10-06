import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:life/gen/assets.gen.dart';
import 'package:life/src/di/dependency_tree.dart';
import 'package:life/src/routes/router.gr.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeScreen> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(flex: 3),
            Image.asset(
              Assets.images.myLifeLogoBlack.assetName,
              width: 300,
              fit: BoxFit.fitWidth,
            ),
            Spacer(flex: 1),
            ElevatedButton(
              child: Text(strings.feelGoodNow, textAlign: TextAlign.center),
              onPressed: () => appRouter.push(FeelGoodNowRoute()),
            ),
            ElevatedButton(
              child: Text(strings.changeWithin, textAlign: TextAlign.center),
              onPressed: () => appRouter.push(ChangeWithinRoute()),
            ),
            ElevatedButton(
              child: Text(strings.attractYourWish, textAlign: TextAlign.center),
              onPressed: () => appRouter.push(AttractWishRoute()),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
