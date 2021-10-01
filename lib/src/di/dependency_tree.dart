import 'package:get_it/get_it.dart';
import 'package:life/src/data/db/database.dart';
import 'package:life/src/routes/router.gr.dart';
import 'package:life/generated/l10n.dart';

final getIt = GetIt.instance;

final appRouter = Liferouter();
Strings get strings => Strings.current;

Future setupDependencyTree() async {
  await _setupDatabase();
}

Future _setupDatabase() async {
  var db = await Database.createInstance();
  if (db.getRootNodes().isEmpty) {
    await db.addInitialData();
  }
  getIt.registerLazySingleton(() => db);
}

// ################### global getters ########################

T inject<T extends Object>() => getIt.get<T>();

Database get database => inject();
