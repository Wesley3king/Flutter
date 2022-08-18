import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temas/app/store/pomodoro.store.dart';

class EntradaTempo extends StatelessWidget {
  final int valor;
  final String titulo;
  final void Function() incremento;
  final void Function() decremento;

  const EntradaTempo({
    super.key,
    required this.valor,
    required this.titulo,
    required this.incremento,
    required this.decremento,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: store.estaTrabalhando() ? Colors.red: Colors.blue,),
                onPressed: () => incremento(),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                )),
            Text(
              '$valor min',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  backgroundColor: store.estaTrabalhando() ? Colors.red: Colors.blue),
              onPressed: () => decremento(),
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
