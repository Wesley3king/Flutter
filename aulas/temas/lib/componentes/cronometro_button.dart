import 'package:flutter/material.dart';

class CronometroButton extends StatelessWidget {
  final IconData icone;
  final String texto;
  final void Function() click;
  CronometroButton({
    super.key,
    required this.icone,
    required this.texto,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        textStyle: const TextStyle(
          fontSize: 25,
        ),
      ),
      onPressed: () => click(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icone,
            size: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(texto),
        ],
      ),
    );
  }
}
