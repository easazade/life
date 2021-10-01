import 'package:flutter/material.dart';
import 'package:life/src/di/dependency_tree.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeScreen> {
  var _data = '';

  _State() {
    var nodes = database.getRootNodes();
    for (var node in nodes) {
      _data += '${node.question!} \n';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.home),
        centerTitle: true,
      ),
      body: Center(
        child: Text(_data),
      ),
    );
  }
}
