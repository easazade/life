import 'package:flutter/material.dart';
import 'package:life/app.dart';
import 'package:life/src/di/dependency_tree.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyTree();
  runApp(LifeApp());
}
