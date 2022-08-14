import 'dart:developer';

import 'package:hive/hive.dart';

Future<Map> database() async {
  // abre uma caixa
  Box box = await Hive.openBox('testeBox');
  // abre uma caixa aberta anteriormente
  //Hive.box('testeBox');

  // await box.put('Map',{
  //   "nome": "Wind breaker",
  //   "capitulos": [
  //     {
  //       "id": "89347",
  //       "pages":  [1, 3, 4]
  //     },
  //     {
  //       "id": "89543",
  //       "pages":  [5, 7, 8]
  //     }
  //   ]
  // });
  //box.deleteAll('Map');
  var res = box.get('Map');

  print(res);

  return res;
}
