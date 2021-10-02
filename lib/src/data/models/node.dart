import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
@HiveType(typeId: 0)
class DataNode extends HiveObject with _$DataNode {
  DataNode._();

  @JsonSerializable()
  factory DataNode({
    @HiveField(0) @JsonKey(name: 'id') @Default(0) final int id,
    @HiveField(1) final String? question,
    @HiveField(2) final String? answer,
    @HiveField(3) @Default([]) final List<DataNode> children,
  }) = DN;
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
