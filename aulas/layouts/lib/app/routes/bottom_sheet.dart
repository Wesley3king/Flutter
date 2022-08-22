import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomSheet'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 400,
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => ListTile(
                            title: Text('item $index'),
                          ),),
                      )
                    ),
                  );
                },
              );
            },
            child: const Text('BottomSheet', style: TextStyle(color: Colors.black),)
            ),
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Column(children: [
                      Text('new bottomsheet')
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DraggableScrollableSheet(
                      minChildSize: 0.3,
                      maxChildSize: 0.7,
                      initialChildSize: 0.3,

                      builder: (context, scrollController) => Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView.separated(
                            controller: scrollController,
                            itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('texto do Listtile $index'),
                              trailing: const Icon(Icons.chevron_right),
                              );
                          }, separatorBuilder: (__,_)=> const Divider(), itemCount: 20)),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
