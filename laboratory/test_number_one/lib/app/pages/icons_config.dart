import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PhotoViewController photoController = PhotoViewController();
  PageController controllerPage = PageController();
  List<String> lista = [
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/00.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/01.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/02.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/03.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/04.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/05.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/06.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/07.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/08.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/09.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/10.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/11.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/12.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/13.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/14.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/15.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/16.jpg",
    "https://mangayabu.top/mangas2/wind-breaker/capitulo-399/17.jpg",
  ];
  Widget _loading() {
    return const SizedBox(
      width: double.infinity,
      height: 500,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: PhotoViewGallery.builder(
          itemCount: lista.length,
          builder: (context, index) => PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(lista[index]),
            initialScale: PhotoViewComputedScale.contained,
            // basePosition: Alignment.topCenter,

            // controller: photoController,
            //heroAttributes: PhotoViewHeroAttributes(tag: "page$index"),
            // onTapDown: (context, details, controllerValue) {
            //   print('to top');
            //   photoController.scale = 1.0;
            // },
            onTapUp: (context, details, controllerValue) {
              
            },
            // tightMode: true,
          ),
          onPageChanged: (index) => print('page: $index'),
          // wantKeepAlive: true,
          allowImplicitScrolling: true,
          // enableRotation: true,
          // gaplessPlayback: true,
          // pageController: controllerPage,

          // scrollDirection: Axis.vertical,
        ));
  }
}// lista.map((e) => Image.network(e)).toList()

// photo view gallery
/*
PhotoView(
          imageProvider: NetworkImage(lista[1]),
        ),
*/