import 'package:flutter_test/flutter_test.dart';
import 'package:life/src/data/db/database.dart';
import 'package:life/src/data/models/node.dart';

Future main() async {
  late Database database;

  var fakeNode = DataNode(id: 0, question: 'what is your problem?', answer: null, children: []);
  var fakeNode2 = DataNode(id: 1, question: 'why are you not happy?', answer: null, children: []);

  setUpAll(() async {
    database = await Database.createInstance(forTest: true);
  });

  tearDown(() async {
    await database.clearAll();
  });

  /// TESTS TESTS TESTS
  /// TESTS TESTS TESTS
  /// TESTS TESTS TESTS
  /// TESTS TESTS TESTS

  test('add a new data node', () async {
    // with no data in database available
    var nodes = database.getRootNodes();
    expect(nodes.isEmpty, true);
    // we add a new entry in database
    await database.saveDataNode(fakeNode);
    // and then we check if new entry is added
    nodes = database.getRootNodes();
    expect(nodes.isEmpty, false);
  });

  test('delete data nodes from database', () async {
    
    // with 2 entries in our databse
    await database.saveDataNode(fakeNode);
    await database.saveDataNode(fakeNode2);
    // we delete that single entry
    await database.deleteDataNode(fakeNode);
    await database.deleteDataNode(fakeNode2);
    // then we check if it is deleted
    var nodes = database.getRootNodes();
    expect(nodes.isEmpty, true);
  });
}
