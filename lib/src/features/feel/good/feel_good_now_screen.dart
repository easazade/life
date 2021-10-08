import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:life/src/data/models/node.dart';
import 'package:life/src/di/dependency_tree.dart';
import 'package:life/src/utils/log.dart';

class FeelGoodNowScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<FeelGoodNowScreen> {
  List<DataNode> _dataNodes = [];

  @override
  void initState() {
    super.initState();
    _dataNodes = database.getRootNodes();
    Log.d(_dataNodes.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(strings.feelGoodNow)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var node in _dataNodes)
              ElevatedButton(
                child: Text(node.question),
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }
}
