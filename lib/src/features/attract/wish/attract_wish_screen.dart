import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:life/src/di/dependency_tree.dart';

class AttractWishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(strings.attractYourWish),
      ),
    );
  }
}
