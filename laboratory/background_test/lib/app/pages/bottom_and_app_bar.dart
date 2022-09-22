import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view_gallery.dart';

class BottomNavigationAndAppBar extends StatefulWidget {
  const BottomNavigationAndAppBar({super.key});

  @override
  State<BottomNavigationAndAppBar> createState() =>
      _BottomNavigationAndAppBarState();
}

class _BottomNavigationAndAppBarState extends State<BottomNavigationAndAppBar> {
  final List<String> lista = [
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
  final Color appBarAndBottomAppBarColor = const Color.fromARGB(146, 0, 0, 0);
  final double sizeOfButtons = 25.0;
  bool isVisible = true;
  ScrollController controller = ScrollController();
  // () => setState(() => isVisible = false)

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: isVisible
            ? AppBar(
                title: const Text("Hide app Bar"),
                backgroundColor: appBarAndBottomAppBarColor,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_border, size: sizeOfButtons,)),
                  const SizedBox(width: 10,)
                ],
                elevation: 0,
              )
            : PreferredSize(preferredSize: Size.zero, child: Container()),
        body: PhotoViewGallery.builder(
          wantKeepAlive: true,
          // scrollDirection: ,
          itemCount: lista.length,
          builder: (context, index) => PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(lista[index]),
            //filterQuality: FilterQuality.high,
            onTapUp: (context, details, controllerValue) =>
                setState(() => isVisible = !isVisible),
          ),
        ),
        bottomNavigationBar: ScrollHideWidget(
            clickVisible: isVisible,
            child: BottomAppBar(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.system_security_update_outlined, size: sizeOfButtons,)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt, size: sizeOfButtons,)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.screen_rotation, size: sizeOfButtons,)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings, size: sizeOfButtons,)),
                ],
              ),
            )));
  }
}
/*
SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: ElevatedButton(
              onPressed: () => setState(() => isVisible = !isVisible),
              child: Text(isVisible ? "hide" : "show")),
        ),
      )
*/

// estas classes devem ser criadas manualmente
class ScrollHideWidget extends StatefulWidget {
  final Widget child;
  //final ScrollController controller;
  final Duration duration;
  final bool clickVisible;

  const ScrollHideWidget(
      {super.key,
      // required this.controller,
      required this.clickVisible,
      this.duration = const Duration(milliseconds: 200),
      required this.child});

  @override
  _ScrollHideWidgetState createState() => _ScrollHideWidgetState();
}

class _ScrollHideWidgetState extends State<ScrollHideWidget> {
  // bool isVisible = true;

  // @override
  // void initState() {
  //   super.initState();

  //   widget.controller.addListener(listen);
  // }

  // @override
  // void dispose() {
  //   super.dispose();

  //   widget.controller.removeListener(listen);
  // }

  // void listen() {
  //   // aqui é onde vai ser dectado e executado o hide ou show
  //   // podemos altera-lo conforme a necessidade( ex: em vez de scroll pode ser um click)
  //   final direction = widget.controller.position.userScrollDirection;
  //   if (direction == ScrollDirection.forward) {
  //     show();
  //   } else if (direction == ScrollDirection.reverse) {
  //     hide();
  //   }
  // }

  // void show() {
  //   if (!isVisible) {
  //      setState(() => isVisible = true);
  //   }
  // }

  // void hide() {
  //   if (isVisible) {
  //     setState(() => isVisible = false);
  //   }
  // }
  final Color appBarAndBottomAppBarColor = const Color.fromARGB(146, 0, 0, 0);

  double hideOrShowOnTap(bool value) {
    if (value) {
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      //     overlays: [SystemUiOverlay.bottom]);
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      // SystemChrome.setSystemUIOverlayStyle(
      //   const SystemUiOverlayStyle(
      //     systemNavigationBarDividerColor: Color.fromARGB(151, 0, 0, 0),
      //     systemNavigationBarColor: Color.fromARGB(151, 0, 0, 0)
      //   )
      // );
      // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //   systemNavigationBarDividerColor: appBarAndBottomAppBarColor));
      return 54.0;
    } else {
      //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      //   systemNavigationBarDividerColor: Color.fromARGB(151, 0, 0, 0),
      //   systemNavigationBarColor: Color.fromARGB(151, 0, 0, 0)));
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      // SystemChrome.setSystemUIOverlayStyle(
      //   const SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     systemNavigationBarDividerColor: Colors.transparent,
      //     systemNavigationBarColor: Colors.transparent,
      //     systemStatusBarContrastEnforced: false,
      //     systemNavigationBarContrastEnforced: false,
      //   )
      // );
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      // se 0 não mostra a bottomBar / isVisible widget.clickVisible ? kBottomNavigationBarHeight : 0
      height: hideOrShowOnTap(widget.clickVisible),
      child: Container(
        color: appBarAndBottomAppBarColor,
        child: Wrap(children: [widget.child])),
    );
  }
}

/*
NestedScrollView(
				// configura para usar certos Widgets
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
					// aqui usaremos este AppBar especial
          const SliverAppBar(
            title: Text('bottom bar'),
            backgroundColor: Colors.blueAccent,
						// configurações de rolagem
            snap: true,
            floating: true,
          ),
        ],
        body: ListView.builder(
          itemCount: 47,
          itemBuilder: (context, index) => const ListTile(
            title: Text('este é um item de lista'),
          ),
        ),
      ),
*/