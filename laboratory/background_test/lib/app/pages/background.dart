import 'dart:ui';

import 'package:flutter/material.dart';

class MyBackgroundTest extends StatefulWidget {
  const MyBackgroundTest({super.key});

  @override
  State<MyBackgroundTest> createState() => _MyBackgroundTestState();
}

class _MyBackgroundTestState extends State<MyBackgroundTest>
    with WidgetsBindingObserver {
  bool isLocked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state != AppLifecycleState.resumed) isLocked = true;
    });
  }

  Widget information() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          children: const <Widget>[
            Icon(Icons.info),
            Text("informações sensiveis")
          ],
        ),
      ),
    );
  }

  Widget noInformation() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Blockeado"),
            IconButton(
                onPressed: () {
                  setState(() {
                    isLocked = false;
                  });
                },
                icon: const Icon(Icons.fingerprint, size: 50,))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Teste de Background"),
        ),
        body: Stack(
          children: [
            information(),
            if (isLocked) noInformation(),
          ],
        ));
  }
}
