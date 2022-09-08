import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lista.length,
      cacheExtent: 10000.0,
      itemBuilder: (context, index) => MyPageImage(url: lista[index]),
    );
  }
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
