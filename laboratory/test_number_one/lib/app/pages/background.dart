import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

// class HiveConfig {
//   static start() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     await Hive.initFlutter(directory.path);
//   }
// }

Future<int> calc(int v) async {
  return 2 + v;
}

Future<void> tst() async {
  int v = await compute(calc, 1000);
}

class Controllar {
  static Box? box;
  start() async {
    box = await Hive.openBox('caixa');
  }

  Future<dynamic> getData() async {
    return await box?.get('dd');
  }

  Future<void> insert(String data) async {
    // debugPrint("insert: ${data[1]} - box: ${data[0]}");
    WidgetsFlutterBinding.ensureInitialized();
    Directory directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    Box? box = await Hive.openBox('caixa');
    await box.put("dd", data[1]);
  }
}

// int computationallyExpensiveTask(int value) {
//   var sum = 0;
//   for (var i = 0; i <= value; i++) {
//     sum += i;
//   }
//   print('finished');
//   return sum;
// }