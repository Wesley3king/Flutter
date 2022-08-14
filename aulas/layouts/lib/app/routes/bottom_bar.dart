import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bottom bar'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(child: Text('Hey guys')),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blueAccent,
        child: IconTheme(
          data: const IconThemeData(color: Colors.white,),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.home,)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.local_library,)),
                const SizedBox(width: 40,),
                IconButton(onPressed: () {}, icon: const Icon(Icons.sell_rounded,)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search,)),
              ],
            ),
          ),),
      ),
    );
  }
}
