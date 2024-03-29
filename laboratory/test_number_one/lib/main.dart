// import 'package:dio/dio.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'app/my_app.dart';
import 'config_hive/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
  // 'resource://drawable/res_app_icon',
  null,
  [
    NotificationChannel(
        channelGroupKey: 'progress_bar',
        channelKey: 'progress_bar',
        channelName: 'Progress notifications',
        channelDescription: 'Notification channel for tests',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white)
  ],
  // Channel groups are only visual and are not required
  channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'progress_bar',
        channelGroupName: 'Basic group')
  ],
  debug: true
);
  runApp(const MyApp());
}

// import 'dart:math';
// // import 'package:flutter/material.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// const numberOfItems = 5001;
// const minItemHeight = 20.0;
// const maxItemHeight = 150.0;
// const scrollDuration = Duration(seconds: 2);

// const randomMax = 1 << 32;

// void main() {
//   runApp(ScrollablePositionedListExample());
// }

// // The root widget for the example app.
// class ScrollablePositionedListExample extends StatelessWidget {
//   const ScrollablePositionedListExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ScrollablePositionedList Example',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const ScrollablePositionedListPage(),
//     );
//   }
// }

// /// Example widget that uses [ScrollablePositionedList].
// ///
// /// Shows a [ScrollablePositionedList] along with the following controls:
// ///   - Buttons to jump or scroll to certain items in the list.
// ///   - Slider to control the alignment of the items being scrolled or jumped
// ///   to.
// ///   - A checkbox to reverse the list.
// ///
// /// If the device this example is being used on is in portrait mode, the list
// /// will be vertically scrollable, and if the device is in landscape mode, the
// /// list will be horizontally scrollable.
// class ScrollablePositionedListPage extends StatefulWidget {
//   const ScrollablePositionedListPage({Key? key}) : super(key: key);

//   @override
//   _ScrollablePositionedListPageState createState() =>
//       _ScrollablePositionedListPageState();
// }

// class _ScrollablePositionedListPageState
//     extends State<ScrollablePositionedListPage> {
//   /// Controller to scroll or jump to a particular item.
//   final ItemScrollController itemScrollController = ItemScrollController();

//   /// Listener that reports the position of items when the list is scrolled.
//   final ItemPositionsListener itemPositionsListener =
//       ItemPositionsListener.create();
//   late List<double> itemHeights = [];
//   var indexes = 0;
//   bool isWorking = false;
//   List<Widget> images = [];
//   // late List<Color> itemColors;
//   //bool reversed = false;

//   /// The alignment to be used next time the user scrolls or jumps to an item.
//   // double alignment = 0;
//   List<String> lista = [
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/00.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/01.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/02.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/03.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/04.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/05.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/06.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/07.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/08.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/09.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/10.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/11.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/12.jpg",
//     "https://mangayabu.top/mangas2/eleceed/capitulo-155/13.jpg"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // final heightGenerator = Random(328902348);
//     // final colorGenerator = Random(42490823);
//     // itemHeights = List<double>.generate(
//     //     numberOfItems,
//     //     (int _) =>
//     //         heightGenerator.nextDouble() * (maxItemHeight - minItemHeight) +
//     //         minItemHeight);
//     // itemColors = List<Color>.generate(numberOfItems,
//     //     (int _) => Color(colorGenerator.nextInt(randomMax)).withOpacity(1));
//   }

//   @override
//   Widget build(BuildContext context) => Material(
//         child: OrientationBuilder(
//           builder: (context, orientation) => Column(
//             children: <Widget>[
//               Expanded(
//                 child: list(orientation),
//               ),
//               positionsView,
//               // Row(
//               //   children: <Widget>[
//               //     Column(
//               //       children: <Widget>[
//               //         //scrollControlButtons,
//               //         const SizedBox(height: 10),
//               //        // jumpControlButtons,
//               //         //alignmentControl,
//               //       ],
//               //     ),
//               //   ],
//               // )
//             ],
//           ),
//         ),
//       );

//   // Widget get alignmentControl => Row(
//   //       mainAxisSize: MainAxisSize.max,
//   //       children: <Widget>[
//   //         const Text('Alignment: '),
//   //         SizedBox(
//   //           width: 200,
//   //           child: SliderTheme(
//   //             data: SliderThemeData(
//   //               showValueIndicator: ShowValueIndicator.always,
//   //             ),
//   //             child: Slider(
//   //               value: alignment,
//   //               label: alignment.toStringAsFixed(2),
//   //               onChanged: (double value) => setState(() => alignment = value),
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     );

//   Widget list(Orientation orientation) => ScrollablePositionedList.builder(
//         itemCount: lista.length,
//         itemBuilder: (context, index) => generateItens(index, context),
//         itemScrollController: itemScrollController,
//         itemPositionsListener: itemPositionsListener,
//         //reverse: reversed,
//         // scrollDirection: orientation == Orientation.portrait
//         //     ? Axis.vertical
//         //     : Axis.horizontal,
//       );

//   Widget get positionsView => ValueListenableBuilder<Iterable<ItemPosition>>(
//         valueListenable: itemPositionsListener.itemPositions,
//         builder: (context, positions, child) {
//           int? min;
//           int? max;
//           if (positions.isNotEmpty) {
//             // Determine the first visible item by finding the item with the
//             // smallest trailing edge that is greater than 0.  i.e. the first
//             // item whose trailing edge in visible in the viewport.
//             min = positions
//                 .where((ItemPosition position) => position.itemTrailingEdge > 0)
//                 .reduce((ItemPosition min, ItemPosition position) =>
//                     position.itemTrailingEdge < min.itemTrailingEdge
//                         ? position
//                         : min)
//                 .index;
//             // Determine the last visible item by finding the item with the
//             // greatest leading edge that is less than 1.  i.e. the last
//             // item whose leading edge in visible in the viewport.
//             max = positions
//                 .where((ItemPosition position) => position.itemLeadingEdge < 1)
//                 .reduce((ItemPosition max, ItemPosition position) =>
//                     position.itemLeadingEdge > max.itemLeadingEdge
//                         ? position
//                         : max)
//                 .index;
//           }
//           return Row(
//             children: <Widget>[
//               Expanded(child: Text('First Item: ${min ?? ''}')),
//               Expanded(child: Text('Last Item: ${max ?? ''}')),
//               // const Text('Reversed: '),
//               // Checkbox(
//               //     value: reversed,
//               //     onChanged: (bool? value) => setState(() {
//               //           reversed = value!;
//               //         }))
//             ],
//           );
//         },
//       );

//   // Widget get scrollControlButtons => Row(
//   //       children: <Widget>[
//   //         const Text('scroll to'),
//   //         scrollButton(0),
//   //         scrollButton(5),
//   //         scrollButton(10),
//   //         scrollButton(100),
//   //         scrollButton(1000),
//   //         scrollButton(5000),
//   //       ],
//   //     );

//   // Widget get jumpControlButtons => Row(
//   //       children: <Widget>[
//   //         const Text('jump to'),
//   //         jumpButton(0),
//   //         jumpButton(5),
//   //         jumpButton(10),
//   //         jumpButton(100),
//   //         jumpButton(1000),
//   //         jumpButton(5000),
//   //       ],
//   //     );

//   // final _scrollButtonStyle = ButtonStyle(
//   //   padding: MaterialStateProperty.all(
//   //     const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//   //   ),
//   //   minimumSize: MaterialStateProperty.all(Size.zero),
//   //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//   // );

//   // Widget scrollButton(int value) => TextButton(
//   //       key: ValueKey<String>('Scroll$value'),
//   //       onPressed: () => scrollTo(value),
//   //       child: Text('$value'),
//   //       style: _scrollButtonStyle,
//   //     );

//   // Widget jumpButton(int value) => TextButton(
//   //       key: ValueKey<String>('Jump$value'),
//   //       onPressed: () => jumpTo(value),
//   //       child: Text('$value'),
//   //       style: _scrollButtonStyle,
//   //     );

//   // void scrollTo(int index) => itemScrollController.scrollTo(
//   //     index: index,
//   //     duration: scrollDuration,
//   //     curve: Curves.easeInOutCubic,
//   //     alignment: alignment);

//   // void jumpTo(int index) =>
//   //     itemScrollController.jumpTo(index: index, alignment: alignment);

//   /// Generate item number [i].
//   ///
//   /// generate itens
//   Widget generateItens(int index, BuildContext context) {
//     if (index < indexes) {
//       return item(index, MediaQuery.of(context).orientation);
//     } else {
//       if (images.length != lista.length) {
//         if (isWorking) {
//           return const SizedBox(
//             width: double.infinity,
//             height: 800,
//             child: Center(child: CircularProgressIndicator()),
//           );
//         } else {
//           getSize(lista[index], MediaQuery.of(context).size.width);
//           return const SizedBox(
//             width: double.infinity,
//             height: 800,
//             child: Center(child: CircularProgressIndicator()),
//           );
//         }
//       } else {
//         return Container();
//       }
//     }
//   }

//   Future<void> getSize(String src, double width) async {
//     try {
//       isWorking = true;
//       Response<List<int>> rs = await Dio().get<List<int>>(src,
//           options: Options(responseType: ResponseType.bytes));
//       // print(rs.data);
//       var image = await decodeImageFromList(Uint8List.fromList(rs.data!));
//       // debugPrint(image is Widget);
//       var image2 = Image.memory(Uint8List.fromList(rs.data!), fit: BoxFit.fill);
//       itemHeights.add((image.height * width) / image.width);
//       // image2.;
//       images.add(image2);
//       debugPrint("imagem : $src adicionada! h : ${image.height.toDouble()}");
//       setState(() {
//         isWorking = false;
//         indexes++;
//       });
//     } catch (e) {
//       debugPrint("erro no codec: $e");
//       isWorking = false;
//       //return Uint8List.fromList([]);
//     }
//   }

//   Widget item(int i, Orientation orientation) {
//     debugPrint("height: ${itemHeights[i]}");
//     return SizedBox(
//       height: itemHeights[i],
//       // width: orientation == Orientation.landscape ? itemHeights[i] : null,
//       child: images[i],
//     );
//   }
// }
/*
Container(
        // color: itemColors[i],
        child: Center(
          child: Text('Item $i'),
        ),
      ),
*/
