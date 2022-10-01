// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:webview_flutter_plus/webview_flutter_plus.dart';
// // import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// class WebviewFlutter extends StatefulWidget {
//   const WebviewFlutter({super.key});

//   @override
//   State<WebviewFlutter> createState() => _WebviewFlutterState();
// }

// class _WebviewFlutterState extends State<WebviewFlutter> {
//   List<String> lista = [
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/00.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/01.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/02.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/03.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/04.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/05.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/06.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/07.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/08.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/09.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/10.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/11.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/12.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/13.jpg"
//   ];

//   String buildPages(BuildContext context) {
//     StringBuffer buffer = StringBuffer();
//     for (String str in lista) {
//       buffer.write(
//           '<img src="$str" width="${MediaQuery.of(context).size.width}px" alt="page of manga" />');
//     }
//     return '''
// <html>
//  <head>
  
//   <title>Document<title>
//   <style>
//    body{margin: 0px;padding:0px;}
//    ::-webkit-scrollbar{display: none;}
//   </style>
//  </head>
//  <body>${buffer.toString()}</body>
// </html>''';
//     /*
//     <!DOCTYPE html><html><head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><title>Document<title><style>*{margin: 0px;padding:0px;}</style></head>  style="margin: 0px;padding:0px;"

//     </html>
//     */
//   }

//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//     // WebView.platform = AndroidWebView();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WebViewPlus(
//       javascriptMode: JavascriptMode.unrestricted,
//       onWebViewCreated: (controllerPlus) {
//         controllerPlus.loadString(buildPages(context));
//       },
//     );
//   }
// }
