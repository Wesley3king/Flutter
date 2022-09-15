import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:test_number_one/app/pages/teste_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// with AutomaticKeepAliveClientMixin, TickerProviderStateMixin
class _HomePageState extends State<HomePage> {
  PhotoViewController photoController = PhotoViewController();
  PageController controllerPage = PageController();
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
  Widget _loading() {
    return const SizedBox(
      width: double.infinity,
      height: 500,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  List<Widget> _buildPhoto(List<String> list) {
    List<GestureDetector> widgets = [];
    for (int i = 0; i < list.length; ++i) {
      widgets.add(
        GestureDetector(
          onTapUp: (details) => print('acionou: ${details} $i// '),
          child: IntrinsicHeight(
              child: Image.network(
            lista[i],
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              //print(loadingProgress);
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )),
        ),
      );
    }
    return widgets;
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  Widget testePhoto(BuildContext context) {
    return Focus(
      autofocus: true,
      child: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemCount: lista.length,
        itemBuilder: (context, index) {
          // if (index == (lista.length - 1)) {
          //   controller.markAsRead();
          // }
          Map<String, String>? headers = {};
          // controller.localStorageService.baseAuthType == AuthType.basic
          //     ? {
          //         "Authorization":
          //             controller.localStorageService.basicAuth,
          //       }
          //     : null;
          return GestureDetector(
            onTap: () => itemScrollController.scrollTo(
        index: 3, duration: const Duration(milliseconds: 300)),
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl: lista[index],
              httpHeaders: headers,
              filterQuality: FilterQuality.medium,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                // height: context.height * .7,
                child: Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const SizedBox(
                // height: context.height,
                child: Center(child: Text("Error builder")),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return testePhoto(context);
  }
} // lista.map((e) => Image.network(e)).toList()

// photo view gallery
/*
PhotoView(
          imageProvider: NetworkImage(lista[1]),
        ),
*/
/*
Image.network(
            lista[index],
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              //print(loadingProgress);
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )*/

/* photo view builder
PhotoViewGallery.builder(
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
        )
*/

/*
Image(
                  image: CachedNetworkImageProvider(lista[index], errorListener: () => print('error listener cache'),),
                  gaplessPlayback: true,
                  
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {

                      return child;
                    }
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),*/
/*
  SizedBox(
        width: double.infinity,
        child: InteractiveViewer(
          maxScale: 5.0,
          clipBehavior: Clip.none,
          child: ListView.builder(
            cacheExtent: 10000.0,
            itemCount: lista.length,
            addAutomaticKeepAlives: true,
            itemBuilder: (context, index) => IntrinsicHeight(
                child: CachedNetworkImage(imageUrl: lista[index],
                placeholder: (context, url) => const SizedBox(
                  height: 500,
                  child: Center(child: CircularProgressIndicator()),
                ),
                
                errorWidget: (context, url, error) => const SizedBox(
                  height: 400,
                  child: Text('Erro ao carregar!'),
                ),
                )),
          //  children: _buildPhoto(lista),
          ),
        ));*/
/*
PhotoViewGallery.builder(
      itemCount: lista.length,
      builder: (context, index) => PhotoViewGalleryPageOptions(
        imageProvider: NetworkImage(lista[index]),
      ),
      onPageChanged: (index) => print('page: $index'),
      wantKeepAlive: true,
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
          ),
        ),
      ),
      scrollPhysics: ScrollPhysics(),
      // allowImplicitScrolling: true,
      // enableRotation: true,

      gaplessPlayback: true,
      // pageController: controllerPage,
      scrollDirection: Axis.vertical,
    )
    
    // extendedImage

    ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) => ExtendedImage.network(
        lista[index],
        //cache: false,
         clearMemoryCacheWhenDispose: true,
         maxBytes: 30,
        compressionRatio: 0.9,
        ),
    )
    
    
    */