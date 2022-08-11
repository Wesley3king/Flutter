
// return Scaffold(
//       body: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           //crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/imgs/currency-icon.png',
//               width: 170,
//               height: 170,
//             ),
//             const SizedBox(
//               height: 50,
//             ),

//             CustomSelectWidget(
//               textController: toText,
//               items: homeController.currencies,
//               selectedItem: homeController.toCurrency,
//               onChanged: (model) {
//                 //print(model.name);
//               },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CustomSelectWidget(
//               textController: fromText,
//               items: homeController.currencies,
//               selectedItem: homeController.fromCurrency,
//               onChanged: (model) {
//                 if (model is CurrencyModel) {
//                   print(model.name);
//                 }
//               },
//             ),
//             //Select(),
//             const SizedBox(
//               width: 10,
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                       const Color.fromARGB(255, 194, 149, 16))),
//               onPressed: () {},
//               child: const Text(
//                 'Converter',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     final TextEditingController toText = TextEditingController();

//   final TextEditingController fromText = TextEditingController();
  