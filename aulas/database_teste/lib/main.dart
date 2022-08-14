import 'package:database_teste/app/my_app.dart';
import 'package:database_teste/configs/hive_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  runApp(const MyApp());
}
