import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:life/src/di/dependency_tree.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeScreen> {
  var _data = '';

  _State() {
    var nodes = database.getRootNodes();
    for (var node in nodes) {
      _data += '${node.question!} \n';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.home),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_data),
            ElevatedButton(
              child: Text('export data'),
              onPressed: _exportData,
            ),
          ],
        ),
      ),
    );
  }

  Future _exportData() async {
    if (await Permission.storage.request().isGranted &&
        await Permission.manageExternalStorage.request().isGranted &&
        await Permission.accessMediaLocation.request().isGranted) {
      var directories = await ExternalPath.getExternalStorageDirectories();
      var directory = Directory('${directories[0]}/Life');
      await directory.create();
      database.exportAllDataTo(directory);
    }
  }
}
