import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:layouts/app/my_app.dart';

void main() async {
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  
  runApp(const MyApp());
}
