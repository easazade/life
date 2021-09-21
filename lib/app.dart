import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life/src/di/dependency_tree.dart';
import 'package:life/generated/l10n.dart';
import 'package:life/src/routes/router.gr.dart';

class LifeApp extends StatelessWidget {
  const LifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: strings.appName,
      localizationsDelegates: const [
        Strings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Strings.delegate.supportedLocales,
      routerDelegate: appRouter.delegate(
        initialRoutes: [
          const HomeRoute(),
        ],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
