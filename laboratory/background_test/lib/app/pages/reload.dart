import 'package:flutter/material.dart';

class ReloadSpinner extends StatefulWidget {
  const ReloadSpinner({super.key});

  @override
  State<ReloadSpinner> createState() => _ReloadSpinnerState();
}

class _ReloadSpinnerState extends State<ReloadSpinner> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.red,
      backgroundColor: Colors.transparent,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 3), () {});
        print("gg izi");
      },
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Text(
              '''Pull to Refresh \n import 'package:flutter/material.dart';

class ReloadSpinner extends StatefulWidget {
  const ReloadSpinner({super.key});

  @override
  State<ReloadSpinner> createState() => _ReloadSpinnerState();
}

class _ReloadSpinnerState extends State<ReloadSpinner> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        print("gg izi");
      },
      child: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text("Pull to Refresh", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
''',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
