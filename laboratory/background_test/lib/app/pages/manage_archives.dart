import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

class ManageArchives extends StatefulWidget {
  const ManageArchives({super.key});

  @override
  State<ManageArchives> createState() => _ManageArchivesState();
}

class _ManageArchivesState extends State<ManageArchives> {
  File? file;

  void deleteFile() async {
    // is working = true
    try {
      file = File("/storage/emulated/0/image.jpg");

      var res = await file?.delete(recursive: false);
      debugPrint("$res");
    } catch (e) {
      print('erro no delete file: $e');
    }
  }

  void createDirectory() async {
    // is working true;

    try {
      debugPrint("atual: ${Directory.current}");
      Directory dir = Directory("/storage/emulated/0/Manga Libray");
      var res = await dir.create(recursive: false);
      debugPrint("dir: $res");
    } catch (e) {
      debugPrint("erro no createDirectory: $e");
    }
  }

  void createFileBackup() async {
    try {
      File file = File("/storage/emulated/0/Manga Libray/backup3.json");
      if (file.existsSync()) {
        debugPrint("este arquivo existe!");
      } else {
        Map<String, dynamic> data = {
          "tipo": "vertical",
          "exists": true,
          "num": [1, 3, 6]
        };
        debugPrint("este arquivo não existe!");
        var resArchive = await file.create(recursive: false);
        debugPrint("archive: $resArchive");
        // resArchive
        //     .writeAsString(data.toString())
        //     .whenComplete(() => debugPrint("file criada!"));
        // var bytes = BytesBuilder();
        // bytes.toBytes()
      }
    } catch (e) {
      debugPrint("erro no createFile: $e");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: TextButton(
          onPressed: () => createFileBackup(),
          child: const Text("delete"),
        )),
      ),
    );
  }
}
