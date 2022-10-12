import 'dart:io';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();
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
    print(_permissionStatus.isDenied ? "não TEM PERMISÃO" : "ta ok");
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
    verPermissao();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) => IntrinsicHeight(
              child: Image.network(lista[index]),
            ));
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
