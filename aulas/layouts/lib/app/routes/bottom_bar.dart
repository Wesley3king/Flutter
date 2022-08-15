import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar>
    with TickerProviderStateMixin {
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
          itemCount: 47,
          itemBuilder: (context, index) => const ListTile(
            title: Text('este é um item de lista'),
          ),
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/fab');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
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
                      Navigator.of(context).pushReplacementNamed('/imageauto');
                    },
                    icon: const Icon(
                      Icons.home,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/hidebottom');
                    },
                    icon: const Icon(
                      Icons.local_library,
                    )),
                const SizedBox(
                  width: 40,
                ),
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
    );
  }
}
