import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:temas/app/store/pomodoro.store.dart';
import 'package:temas/componentes/cronometro.dart';
import 'package:temas/componentes/cronometro_button.dart';
import 'package:temas/componentes/entrada_tempo.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Widget _trocarButtonStart(bool iniciado, void Function() iniciar, void Function() parar) {
      if (iniciado) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: CronometroButton(icone: Icons.pause, texto: 'parar', click: parar,),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: CronometroButton(icone: Icons.play_arrow, texto: 'iniciar', click: iniciar,),
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Observer(builder: (_) => Container(
              color: store.estaTrabalhando() ?Colors.red : Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cronometro(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       _trocarButtonStart(
                        store.iniciado,
                         store.iniciar,
                          store.parar,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: CronometroButton(
                            icone: Icons.refresh,
                             texto: 'reiniciar',
                              click: store.reiniciar,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
           ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EntradaTempo(
                      valor: store.tempoTrabalho,
                      titulo: 'Trabalho',
                      incremento: store.incrementarTempoTrabalho,
                      decremento: store.decrementarTempoTrabalho,
                    ),
                    EntradaTempo(
                      valor: store.tempoDescanso,
                      titulo: 'Descanso',
                      incremento: store.incrementarTempoDescanso,
                      decremento: store.decrementarTempoDescanso,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
