import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewx/webviewx.dart';

class MyWebviewx extends StatefulWidget {
  const MyWebviewx({super.key});

  @override
  State<MyWebviewx> createState() => _MyWebviewxState();
}

class _MyWebviewxState extends State<MyWebviewx> {
  bool showThis = false;
  late WebViewXController webviewController;
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

  String buildPages(BuildContext context) {
    // StringBuffer buffer = StringBuffer();
    // for (String str in lista) {
    //   buffer.write(
    //       '<img src="$str" width="${MediaQuery.of(context).size.width}px" alt="page of manga" />');
    // }
    // return '<head><style>::-webkit-scrollbar{display: none;}</style></head><body style="margin: 0px;padding:0px;">${buffer.toString()}</body>';
    return '<head><style>::-webkit-scrollbar{display: none;}</style></head><body style="margin: 0px;padding:0px;"><img src="/storage/emulated/0/image.jpg" width="${MediaQuery.of(context).size.width}px" alt="page of manga" /></body>';
    /*
    <!DOCTYPE html><html><head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><title>Document<title><style>*{margin: 0px;padding:0px;}</style></head>

    </html>
    */
  }

  List<Widget> buildInfo(BuildContext context) {
    final double height = MediaQuery.of(context).size.height - 120;
    debugPrint("orintacion: ${MediaQuery.of(context).orientation}");
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? true
            : false;
    return [
      AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: showThis ? 60 : 0,
        child: Container(
          color: Colors.black54,
          width: MediaQuery.of(context).size.width,
          height: showThis ? 60 : 0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: isLandscape ? 0 : 170),
        child: GestureDetector(
          onTap: () => setState(() {
            showThis = !showThis;
          }),
          onDoubleTap: () => webviewController.callJsMethod("scroll", []),
          child: Container(
            //color: Colors.black54,
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            height: 200,
            width: MediaQuery.of(context).size.width - 190,
          ),
        ),
      ),
      AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: showThis ? 60 : 0,
        child: Wrap(
          children: [
            Container(
              color: Colors.black54,
              width: MediaQuery.of(context).size.width,
              height: 60,
            )
          ],
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // Future.delayed(
    //     const Duration(seconds: 2),
    //     () => webviewController.loadContent( // 'https://flutter.dev'
    //       "https://wesley3king.github.io/mangaKa/maked/",
    //           SourceType.url,
    //         ));
  }

  @override
  void dispose() {
    super.dispose();
    webviewController.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewX(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          initialContent: buildPages(context), // buildPages(context)
          initialSourceType: SourceType.html, // SourceType.html
          onWebViewCreated: (controller) => webviewController = controller,
          jsContent: const {
            EmbeddedJsContent(
                js: "function scroll() { window.scrollTo(500); }"),
            EmbeddedJsContent(
              webJs:
                  'window.document.addEventListener("click", ()=> PrintNaTelaGG("i m king"));',
              mobileJs:
                  'window.document.addEventListener("click", ()=> PrintNaTelaGG("i m king"));',
            ),
          },
          dartCallBacks: {
            DartCallback(
              name: "PrintNaTelaGG",
              callBack: (message) => log("menssagem: $message"),
            )
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildInfo(context),
          ),
        )
      ],
    );
  }
}
