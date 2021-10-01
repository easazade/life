import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
@HiveType(typeId: 0)
class DataNode with _$DataNode {
  factory DataNode({
    @HiveField(0) required final int id,
    @HiveField(1) required final String question,
    @HiveField(2) final String? answer,
    @HiveField(3) @Default([]) final List<DataNode> children,
  }) = DATANODE;

  factory DataNode.fromJson(Map<String, dynamic> json) => _$DataNodeFromJson(json);
}
