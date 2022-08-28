import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:mj_image_slider/mj_image_slider.dart';
import 'package:mj_image_slider/mj_options.dart';
import 'package:slider_view/slider_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InteractiveViewer(
        maxScale: 4.0,
        child: SliderView(
          config: SliderViewConfig(
            models: lista,
            itemBuilder: (model) => Image.network(model),
            scrollDirection: Axis.vertical
          ),
        )
      ),
    );
  }
}// lista.map((e) => Image.network(e)).toList()
/* carousel slider
]CarouselSlider(
            items: lista
                .map((e) => IntrinsicHeight(
                      child: SizedBox(width: double.infinity,child: Image(image: CachedNetworkImageProvider(e),)),
                    ))
                .toList(),
            options: CarouselOptions(
              scrollDirection: Axis.vertical,
              enableInfiniteScroll: true,
              initialPage: 0,
              disableCenter: true,
              pageSnapping: false,
              onPageChanged: (index, reason) => print(index),
              )),
              */