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
    StringBuffer buffer = StringBuffer();
    for (String str in lista) {
      buffer.write(
          '<img src="$str" width="${MediaQuery.of(context).size.width}px" alt="page of manga" />');
    }
    return '<head><style>::-webkit-scrollbar{display: none;}</style></head><body style="margin: 0px;padding:0px;">${buffer.toString()}</body>';
    // return '<head><style>::-webkit-scrollbar{display: none;}</style></head><body style="margin: 0px;padding:0px;"><img src="/storage/emulated/0/image.jpg" width="${MediaQuery.of(context).size.width}px" alt="page of manga" /></body>';
    /*
    <!DOCTYPE html><html><head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><title>Document<title><style>*{margin: 0px;padding:0px;}</style></head>

    </html>
    */
  }

  List<Widget> buildInfo(BuildContext context) {
    final double height = MediaQuery.of(context).size.height - 120;
    debugPrint("orintacion: ${MediaQuery.of(context).orientation}");
    showThis ? SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge) :
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
        padding: EdgeInsets.only(
            bottom: isLandscape ? 0 : 170), // isLandscape ? 0 : 170
        child: GestureDetector(
          onTap: () {
            setState(() {
              showThis = !showThis;
            });
          },
          // onTapUp: (details) {
          //   setState(() {
          //     showThis = !showThis;
          //   });
          // },
          //onDoubleTap: () => webviewController.callJsMethod("scroll", []),
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 400,
              maxWidth: 300,
              minHeight: 300,
              minWidth: 200
            ),
            height: 200,
            width: MediaQuery.of(context).size.width - 190,
            child: GestureDetector(onTap: () => setState(() {
            showThis = !showThis;
          }),),
          ),
        ),
      ),
      AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: showThis ? 180 : 0,
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(width: 3.0,),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Material(
                              color: const Color.fromARGB(179, 0, 0, 0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.skip_previous, size: 25,)))),
                              const SizedBox(width: 3.0,),
                            Flexible(
                              child: SizedBox(height: 50, child: Material(
                                color: const Color.fromARGB(179, 0, 0, 0),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Slider(
                                  value: 1.0,
                                  max: 3.0,
                                  min: 0.0,
                                  onChanged: (value){},
                                )
                              ),),
                            ),
                            const SizedBox(width: 3.0,),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Material(
                              color: const Color.fromARGB(179, 0, 0, 0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next, size: 25,)),)),
                          const SizedBox(width: 3.0,),
                        ],
                      ),
                    ),
            ),
            Container(
              color: Colors.black54,
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,),
                  const SizedBox(height: 60,)
                ],
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
            // EmbeddedJsContent(
            //   webJs:
            //       'window.document.addEventListener("click", ()=> PrintNaTelaGG("i m king"));',
            //   mobileJs:
            //       'window.document.addEventListener("click", ()=> PrintNaTelaGG("i m king"));',
            // ),
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
