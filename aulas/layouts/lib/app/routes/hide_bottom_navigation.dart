import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyScrollBottomBar extends StatefulWidget {
  const MyScrollBottomBar({Key? key}) : super(key: key);

  @override
  State<MyScrollBottomBar> createState() => _MyScrollBottomBarState();
}

class _MyScrollBottomBarState extends State<MyScrollBottomBar>
    with TickerProviderStateMixin {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              title: Text('bottom bar'),
              backgroundColor: Colors.blueAccent,
              snap: true,
              floating: true,
            ),
          ],
          body: ListView.builder(
            controller: controller,
            itemCount: 47,
            itemBuilder: (context, index) => const ListTile(
              title: Text('este é um item de lista'),
            ),
          ),
        ),
        //extendBody: true,
        bottomNavigationBar: ScrollHideWidget(
          controller: controller,
          child: BottomAppBar(
            //shape: const CircularNotchedRectangle(),
            color: Colors.blueAccent,
            child: IconTheme(
              data: const IconThemeData(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/bottomsheet');
                        },
                        icon: const Icon(
                          Icons.home,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.local_library,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.sell_rounded,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ScrollHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollHideWidget(
      {super.key,
      required this.controller,
      this.duration = const Duration(milliseconds: 200),
      required this.child});

  @override
  _ScrollHideWidgetState createState() => _ScrollHideWidgetState();
}

class _ScrollHideWidgetState extends State<ScrollHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    super.dispose();

    widget.controller.removeListener(listen);
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible)
      setState(() {
        isVisible = true;
      });
  }

  void hide() {
    if (isVisible)
      setState(() {
        isVisible = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? kBottomNavigationBarHeight : 0,
      child: Wrap(children: [widget.child]),
    );
  }
}
