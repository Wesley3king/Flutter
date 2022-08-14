import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyFabScroll extends StatefulWidget {
  const MyFabScroll({Key? key}) : super(key: key);

  @override
  State<MyFabScroll> createState() => _MyFabScrollState();
}

class _MyFabScrollState extends State<MyFabScroll>
    with TickerProviderStateMixin {
  bool showFAB = true;

  // controller da animação
  late final _contoller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  )..forward();

  // animação
  late final _animation = CurvedAnimation(
    parent: _contoller,
    curve: Curves.fastOutSlowIn,
  );

// o dispose cancela a animação e o controller
  @override
  void dispose() {
    super.dispose();
    _contoller.dispose();
    _animation.dispose();
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
        body: NotificationListener<UserScrollNotification>(
          onNotification: (scroll) {
            if (scroll.direction == ScrollDirection.reverse && showFAB) {
              _contoller.reverse();
              showFAB = false;
            } else if (scroll.direction == ScrollDirection.forward && !showFAB) {
              _contoller.forward();
              showFAB = true;
            }
            return true;
          },
          child: ListView.builder(
            itemCount: 47,
            itemBuilder: (context, index) => const ListTile(
              title: Text('este é um item de lista'),
            ),
          ),
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/bottom');
          },
          child: const Icon(Icons.work),
        ),
      ),
    );
  }
}
