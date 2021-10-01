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

  Future clearAll() async {
    await _dataNodes.clear();
  }
}
