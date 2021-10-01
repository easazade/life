import 'package:hive_flutter/adapters.dart';
import 'package:life/src/data/models/node.dart';

class Database {
  late final Box<DataNode> _dataNodes;

  Database._(this._dataNodes);

  static Future<Database> createInstance() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DataNodeAdapter());
    var dataNodesBox = await Hive.openBox<DataNode>('data_nodes_box');
    return Database._(dataNodesBox);
  }
}
