
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

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
          },
        ),
      ),
    );
  }

  Future _downloadImage(String url) async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage("https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png", destination: AndroidDestinationType.directoryDownloads..subDirectory('flutter_image1.png'));
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
}
