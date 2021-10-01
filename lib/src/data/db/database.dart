import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:life/src/data/models/node.dart';

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

  Future clearAll() async {
    await _dataNodes.clear();
  }

  List<DataNode> getRootNodes() => _dataNodes.values.toList();

  Future deleteDataNode(DataNode dataNode) async {
    await _dataNodes.delete(dataNode.key);
  }

  Future addInitialData() async {
    var node1 = DataNode(id: 0, question: 'مشکلت چیه؟', answer: null, children: []);
    var node2 = DataNode(id: 1, question: 'چرا حالت خوب نیست؟', answer: null, children: []);
    await saveDataNode(node1);
    await saveDataNode(node2);
  }
}
