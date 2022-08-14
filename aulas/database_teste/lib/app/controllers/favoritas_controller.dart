import 'dart:collection';

import 'package:database_teste/adapters/moeda_hive_adapter.dart';
import 'package:database_teste/app/models/moeda_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritasRepository extends ChangeNotifier {
  List _lista = [];
  late LazyBox box;

  FavoritasRepository() {
    _startRepository();
  }

  _startRepository() async {
    await _openBox();
    await _readFavoritas();
  }

  _openBox() async {
    Hive.registerAdapter(MoedaHiveAdapter());
    box = await Hive.openLazyBox('moedas_favoritas');
  }

  _readFavoritas() {
    box.keys.forEach((moeda) async {
      Moeda m = await box.get(moeda);
      _lista.add(m);
      notifyListeners();
    });
  }

  UnmodifiableListView get lista => UnmodifiableListView(_lista);

  saveAll(List moedas) {
    moedas.forEach((moeda) {
      if (!_lista.any((atual) => atual.sigla == moeda.sigla)) {
        _lista.add(moeda);
        box.put(moeda.sigla, moeda);
      }
    });

    notifyListeners();
  }

  remove(var moeda) {
    _lista.remove(moeda);
    box.delete(moeda.sigla);
    notifyListeners();
  }
}
