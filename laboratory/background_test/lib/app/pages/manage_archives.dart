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

  void deleteDirectory() async {
    try {
      Directory dir = Directory("/storage/emulated/0/Manga Libray");
      dir.delete(recursive: false).whenComplete(() => print("deletado!"));
    } catch (e) {
      debugPrint("erro no delete Directory: $e");
    }
  }

  void createFileBackup() async {
    try {
      File file = File("/storage/emulated/0/Manga Libray/backup5_bynary.bin");
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

        var jsonData = json.encode(data);
        var bynary = utf8.encode(jsonData);
        resArchive
            .writeAsBytes(bynary)
            .whenComplete(() => debugPrint("file escrita!"));
      }
    } catch (e) {
      debugPrint("erro no createFile: $e");
    }
  }

  void readArchive() async {
    try {
      File file = File("/storage/emulated/0/Manga Libray/backup5_bynary.bin");
      var bin = await file.readAsBytes();
      print(bin);
      var data = utf8.decode(bin);
      print(data);
    } catch (e) {
      debugPrint("erro no readArchive: $e");
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
            child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () => createFileBackup(),
              child: const Text("create"),
            ),
            TextButton(
              onPressed: () => readArchive(),
              child: const Text("read"),
            ),
            TextButton(
              onPressed: () => deleteDirectory(),
              child: const Text("delete dir"),
            ),
          ],
        )),
      ),
    );
  }
}
