import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'node.g.dart';

@HiveType(typeId: 0)
class DataNode extends HiveObject {
  DataNode({
    required this.id,
    required this.question,
    required this.answer,
    required this.children,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String question;

  @HiveField(2)
  final String? answer;

  @HiveField(3)
  final List<DataNode> children;
}

extension DataNodeExt on DataNode {
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    map['answer'] = answer;
    map['children'] = children.map((e) => e.toJson()).toList();
    return map;
  }
}
