import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppSettings extends ChangeNotifier {
  late Box box;

  AppSettings() {
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    await _readLocale();
  }

  Future<void> _startPreferences() async {
    box = await Hive.openBox('preferencias');
  }

  _readLocale() {
    final local = box.get('local') ?? 'pt_BR';
    final name = box.get('name') ?? 'R\$';

    var locale = {
      'locale': local,
      'name': name,
    };

    notifyListeners();
  }

  setLocale(String local, String name) async {
    await box.put('local', local);
    await box.put('name', name);

    await _readLocale();
  }
}
