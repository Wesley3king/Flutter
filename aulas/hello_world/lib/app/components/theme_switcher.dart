
import 'package:flutter/material.dart';
import 'package:hello_world/app/components/app_controler.dart';

class CustonSwitcher extends StatelessWidget {
  const CustonSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppControler.instance,
      builder: (context, child) {
        return Switch(
          value: AppControler.instance.isDarkTheme,
          onChanged: (value) {
            AppControler.instance.changeTheme();
          },
        );
      },
    );
  }
}