import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:life/src/data/models/node.dart';
import 'package:life/src/utils/log.dart';

class Database {
  late final Box<DataNode> _dataNodes;

  Database._(this._dataNodes);

  static Future<Database> createInstance({bool forTest = false}) async {
    if (!forTest && !kReleaseMode) {
      await Hive.initFlutter();
    } else {
      Hive.init(Directory.current.path);
    }
    Hive.registerAdapter(DataNodeAdapter());
    var dataNodesBox = await Hive.openBox<DataNode>('data_nodes_box');
    return Database._(dataNodesBox);
  }

  Future saveDataNode(DataNode dataNode) => _dataNodes.add(dataNode);

  Future clearAll() => _dataNodes.clear();

  List<DataNode> getRootNodes() {
    var nodes = _dataNodes.values.toList();
    return nodes;
  }

  Future deleteDataNode(DataNode dataNode) => _dataNodes.delete(dataNode.key);

  Future addInitialData() async {
    var node1 = DataNode(id: 0, question: 'مشکلت چیه؟', answer: '', children: []);
    var node2 = DataNode(id: 1, question: 'چرا حالت خوب نیست؟', answer: '', children: []);
    await saveDataNode(node1);
    await saveDataNode(node2);
  }

  Future exportAllDataTo(Directory directory) async {
    var data = [];
    getRootNodes().forEach((nodeData) => data.add(nodeData.toJson()));
    Log.d(jsonEncode(data));
    var exportJsonFile = File('${directory.path}/export ${DateTime.now().toString().replaceAll(':', '-')}.txt');
    await exportJsonFile.create(recursive: true);
    await exportJsonFile.writeAsString(jsonEncode(data));
  }
}
