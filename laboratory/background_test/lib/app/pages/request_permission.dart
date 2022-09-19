import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler extends StatefulWidget {
  const PermissionHandler({super.key});

  @override
  State<PermissionHandler> createState() => _PermissionHandlerState();
}

class _PermissionHandlerState extends State<PermissionHandler> {
  // bool writePermission = false;
  // bool readPermission = false;
  PermissionStatus _permissionWriteStatus = PermissionStatus.denied;
  PermissionStatus _permissionReadStatus = PermissionStatus.denied;

  void getWritePermission() async {
    _permissionWriteStatus = await Permission.manageExternalStorage.status;
    // print(_permissionWriteStatus.isDenied ? "não TEM PERMISÃO" : "ta ok");
    if (_permissionWriteStatus != PermissionStatus.granted) {
      print("fazendo a requisição do write");
      PermissionStatus permissionStatus =
          await Permission.manageExternalStorage.request();
      setState(() {
        _permissionWriteStatus = permissionStatus;
      });
    }
  }

  void getReadPermission() async {
    _permissionReadStatus = await Permission.storage.status;
    // print(_permissionReadStatus.isDenied ? "não TEM PERMISÃO" : "ta ok");
    if (_permissionReadStatus != PermissionStatus.granted) {
      print("fazendo a requisição do read");
      PermissionStatus permissionStatus = await Permission.storage.request();
      setState(() {
        _permissionReadStatus = permissionStatus;
      });
    }
  }

  Future _downloadImage() async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(
          "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
          destination: AndroidDestinationType.directoryPictures
            ..subDirectory('teste_img/flutter_tst.png'));
      if (imageId == null) {
        print("sem permissão");
        return;
      }
      //AndroidDestinationType.directoryPictures
      // ..subDirectory('images/imagem1.png')
      //custom(directory: 'testeimage')
      var path = await ImageDownloader.findPath(imageId);
      print("path: $path");

      // // Below is a method of obtaining saved image information.
      // var fileName = await ImageDownloader.findName(imageId);
      // var path = await ImageDownloader.findPath(imageId);
      // print(path);
      // var size = await ImageDownloader.findByteSize(imageId);
      // var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print('erro! -------------------');
      print(error);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getReadPermission();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => getReadPermission(),
                child: const Text("Ler arquivos")),
            _permissionReadStatus.isDenied
                ? const Text(
                    "Tem permissão",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                : const Text(
                    "nã o tem permissão",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
            ElevatedButton(
                onPressed: () => getWritePermission(),
                child: const Text("escrever arquivos")),
            ElevatedButton(
                onPressed: () => _downloadImage(),
                child: const Text("download an file")),
            _permissionWriteStatus.isDenied
                ? const Text(
                    "não Tem permissão",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                : SizedBox(
                    width: 40,
                    height: 50,
                    child: Image.file(File(
                        "/storage/emulated/0/Pictures/teste_img/flutter_tst.png"))),
          ],
        ),
      ),
    );
  }
}
