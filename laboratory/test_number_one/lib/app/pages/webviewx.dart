import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewx/webviewx.dart';

class MyWebviewx extends StatefulWidget {
  const MyWebviewx({super.key});

  @override
  State<MyWebviewx> createState() => _MyWebviewxState();
}

class _MyWebviewxState extends State<MyWebviewx> {
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
    StringBuffer buffer = StringBuffer();
    for (String str in lista) {
      buffer.write(
          '<img src="$str" width="${MediaQuery.of(context).size.width}px" alt="page of manga" />');
    }
    return '<head><style>::-webkit-scrollbar{display: none;}</style></head><body style="margin: 0px;padding:0px;">${buffer.toString()}</body>';
    /*
    <!DOCTYPE html><html><head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><title>Document<title><style>*{margin: 0px;padding:0px;}</style></head>

    </html>
    */
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewX(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          initialContent: 'https://flutter.dev', // buildPages(context)
          initialSourceType: SourceType.url,// SourceType.html
          onWebViewCreated: (controller) => webviewController = controller,
        ),
        Container(
          color: Colors.black54,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        )
      ],
    );
  }
}
