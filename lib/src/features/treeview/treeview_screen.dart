import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:life/src/di/dependency_tree.dart';
import 'package:life/src/utils/log.dart';

class TreeViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TreeViewScreen> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  _State() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    graph.addNodes([node1, node2, node3, node4]);
    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3,
        paint: Paint()
          ..color = Colors.red
          ..strokeWidth = 2);
    graph.addEdge(node1, node4);
    graph.addEdge(node4, node5);
    graph.addEdge(node2, node5);
    graph.addEdge(node3, node6);

    builder
      ..siblingSeparation = (25)
      ..levelSeparation = (40)
      ..subtreeSeparation = (40)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.home),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.amber,
          child: InteractiveViewer(
              constrained: false,
              boundaryMargin: EdgeInsets.all(100),
              scaleEnabled: false,
              child: GraphView(
                graph: graph,
                algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = Colors.blue
                  ..strokeWidth = 2
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  // I can decide what widget should be shown here based on the id
                  var a = node.key!.value as int;
                  return rectangleWidget(a);
                },
              )),
        ),
      ),
    );
  }

  Widget rectangleWidget(int id) {
    return InkWell(
      onTap: () {
        Log.i('clicked $id');
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(color: id.isEven ? Colors.blue[100]! : Colors.red[100]!, spreadRadius: 1),
          ],
        ),
        child: Text('Node $id'),
      ),
    );
  }
}
