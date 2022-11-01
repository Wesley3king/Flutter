import 'dart:io';
import 'dart:async';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:test_number_one/app/pages/background.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();
  final Controllar controllar = Controllar();
  final ScreenBrightness screenBrightness = ScreenBrightness();
  late List<double> itemHeights;
  late List<Color> itemColors;
  bool reversed = false;
  List<String> lista = [
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/00.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/01.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/02.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/03.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/04.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/05.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/06.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/07.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/08.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/09.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/10.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/11.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/12.jpg",
    "https://mangayabu.top/mangas2/eleceed/capitulo-155/13.jpg"
  ];
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  Future verPermissao() async {
    _permissionStatus = await Permission.storage.status;
    debugPrint(_permissionStatus.isDenied ? "não TEM PERMISÃO" : "ta ok");
    if (_permissionStatus != PermissionStatus.granted) {
      PermissionStatus permissionStatus = await Permission.storage.request();
      setState(() {
        _permissionStatus = permissionStatus;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black26));
    // verPermissao();
    start();
  }

  void start() async {
    await controllar.start();
    // final ReceivePort receivePort = ReceivePort();

    // await Isolate.spawn( controllar.insert, receivePort.sendPort);
    //await compute(controllar.insert, 'king');

    debugPrint('data: ${await controllar.getData()}');
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("luminosidade: ${MediaQuery.of(context)}");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Detalhes do Mangá'),
        actions: [
          IconButton(
            onPressed: () {
              // utilize url_launcher
              // itemScrollController.scrollTo(
              //   index: 1,
              //   duration: const Duration(milliseconds: 300));
              // screenBrightness.setScreenBrightness(0.0);
              screenBrightness.resetScreenBrightness();
              // ScrollController().animateTo(offset, duration: duration, curve: curve)
            },
            tooltip: "Compartilhar",
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: ColorFiltered(
        colorFilter: ColorFilter.mode(
            Color.fromARGB(255, 216, 61, 203), BlendMode.color),
        child: ScrollablePositionedList.builder(
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionListener,
            padding: const EdgeInsets.all(0),
            // shrinkWrap: true,
            itemCount: lista.length,
            itemBuilder: (context, index) => IntrinsicHeight(
                  child: Image.network(lista[index]),
                )),
      ),
    );
  }
  /*ListView.builder(
      itemCount: lista.length,
      cacheExtent: 10000.0,
      itemBuilder: (context, index) => MyPageImage(url: lista[index]),
    )
    
    !(_permissionStatus == PermissionStatus.denied) ? Image.file(File("/storage/emulated/0/image.jpg")) : const Center(
        child: Text("error", style: TextStyle(color: Colors.white),),
      )*/
}
/*
PageView.builder(
      itemCount: lista.length,
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      onPageChanged: (value) => print("pagina: $value"),
      itemBuilder: (context, index) => MyPageImage(url: lista[index]),
    )
    */

class MyPageImage extends StatefulWidget {
  final String url;
  const MyPageImage({super.key, required this.url});

  @override
  State<MyPageImage> createState() => _MyPageImageState();
}

class _MyPageImageState extends State<MyPageImage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Image.network(
        widget.url,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                  value: loadingProgress.expectedTotalBytes == null
                      ? null
                      : loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
