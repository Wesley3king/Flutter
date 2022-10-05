import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class BottomNavigationTeste extends StatefulWidget {
  const BottomNavigationTeste({super.key});

  @override
  State<BottomNavigationTeste> createState() => _BottomNavigationTesteState();
}

class _BottomNavigationTesteState extends State<BottomNavigationTeste> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          controller: controller,
          itemCount: 30,
          itemBuilder: (context, index) => const ListTile(
            title: Text("item data"),
          ),
        ),
      ),
      bottomNavigationBar: ScrollHideWidget(
        controller: controller,
        child: BottomNavigationBarTheme(
          data: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromARGB(94, 0, 0, 0)),
          child: BottomNavigationBar(
            currentIndex: 1,
            onTap: (value) => debugPrint("indo para a rota: $value"),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(
                    Icons.home_outlined,
                    color: Colors.red,
                  ),
                  label: "home page"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.import_contacts),
                  activeIcon: Icon(
                    Icons.import_contacts_sharp,
                    color: Colors.red,
                  ),
                  label: "home page")
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  const ScrollHideWidget(
      {super.key,
      required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 200)});

  @override
  State<ScrollHideWidget> createState() => _ScrollHideWidgetState();
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
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarColor: Colors.transparent));
    } else if (direction == ScrollDirection.reverse) {
      hide();
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.black26,
        systemNavigationBarColor: Colors.black26));
    }
  }

  void show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? (kBottomNavigationBarHeight + 48) : 0,
      child: Wrap(
        children: [widget.child],
      ),
    );
  }
}