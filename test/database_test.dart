import 'package:flutter_test/flutter_test.dart';
import 'package:life/src/data/db/database.dart';

Future main() async{
  late Database database;

  setUpAll(() async {
    database = await Database.createInstance(forTest:true);
  });

  tearDown(() async {
    await database.clearAll();
  });

  test('test run', () async{
    await Future.delayed(Duration(seconds: 2));
  });
}
