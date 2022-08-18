import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:temas/app/store/pomodoro.store.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(builder: (_) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          (store.estaTrabalhando() ? 'Hora de Trabalhar' : 'Hora de Descansar'),
          style: const TextStyle(fontSize: 40, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
         Text(
          '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 120, color: Colors.white),),
      ],
    ),);
  }
}
