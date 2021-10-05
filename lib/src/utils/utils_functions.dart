import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:life/src/di/dependency_tree.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Directory> getAppPublicDirectory() async {
  var directories = await ExternalPath.getExternalStorageDirectories();
  var directory = Directory('${directories[0]}/Life');
  if (!await directory.exists()) {
    await directory.create();
  }
  return directory;
}

Future<bool> storageAccessGranted() async {
  return await Permission.storage.request().isGranted &&
      await Permission.manageExternalStorage.request().isGranted &&
      await Permission.accessMediaLocation.request().isGranted;
}

Future exporApptData() async {
  if (await storageAccessGranted()) {
    var directory = await getAppPublicDirectory();
    database.exportAllDataTo(directory);
  }
}
