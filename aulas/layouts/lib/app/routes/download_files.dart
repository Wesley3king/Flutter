import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

class DownloadFiles extends StatefulWidget {
  const DownloadFiles({Key? key}) : super(key: key);

  @override
  State<DownloadFiles> createState() => _DownloadFilesState();
}

class _DownloadFilesState extends State<DownloadFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Download'),
          onPressed: () async {
            _downloadImage(
                'https://images.pexels.com/photos/12993265/pexels-photo-12993265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            // teste_de_path();
          },
        ),
      ),
    );
  }

  Future _downloadImage(String url) async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(
          "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
          destination: AndroidDestinationType.directoryPictures
          ..subDirectory('teste_img/flutter-logo2.png'));
      //AndroidDestinationType.directoryPictures
      // ..subDirectory('images/imagem1.png')
      //custom(directory: 'testeimage')

      if (imageId == null) {
        return;
      }

      // // Below is a method of obtaining saved image information.
      // var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      print(path);
      // var size = await ImageDownloader.findByteSize(imageId);
      // var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print('erro! -------------------');
      print(error);
    } catch (e) {
      print(e);
    }
  }

  // Future<void> teste_de_path() async {
  //   var path2 = await getExternalStorageDirectory();
  //   var caminho = '/storage/emulated/0/manga_teste';
  //   path.join('/storage/emulated/0/manga_teste');
  //   await path2?.create();
  //   print(path2);
  // }
}
