import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
@HiveType(typeId: 0)
abstract class DataNode implements _$DataNode {
  DataNode._();

  @JsonSerializable()
  factory DataNode({
    @HiveField(0) @Default(0) final int id,
    @HiveField(1) final String? question,
    @HiveField(2) final String? answer,
    @HiveField(3) @Default([]) final List<DataNode> children,
  }) = DN;

  // factory DataNode.fromJson(Map<String, dynamic> json) => _$DataNodeFromJson(json);
}
