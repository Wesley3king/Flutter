import 'package:flutter/material.dart';
import 'package:temas/app/routes/home_page.dart';
import 'package:provider/provider.dart';
import 'package:temas/app/store/pomodoro.store.dart';


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.green,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  ThemeData theme = lightTheme;

  void temaAutomatic() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;

    setState(() {
      brightness == Brightness.dark ? theme = darkTheme : theme = lightTheme;
    });
  }

// ao utilizar este mixin é necessario chamar o intState
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    temaAutomatic();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    temaAutomatic();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(create: (_) => PomodoroStore()),
      ],
      child: MaterialApp(
        theme: theme,
        home: HomePage(),
      ),
    );
  }
}
