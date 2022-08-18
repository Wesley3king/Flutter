import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

enum TipoItevalo { trabalho, descanso }

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;
  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;
  @observable
  int tempoDescanso = 1;

  @observable
  TipoItevalo tipoItevalo = TipoItevalo.descanso;

  Timer? cronometro;

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho() {
    tempoTrabalho--;
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
  }

  @action
  void decrementarTempoDescanso() {
    tempoDescanso--;
  }

  bool estaTrabalhando() {
    return tipoItevalo == TipoItevalo.trabalho;
  }

  bool estaDescansando() {
    return tipoItevalo == TipoItevalo.descanso;
  }

  void _trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoItevalo = TipoItevalo.descanso;
      minutos = tempoDescanso;
    } else {
      tipoItevalo = TipoItevalo.trabalho;
      minutos = tempoTrabalho;
    }

    segundos = 0;
  }
}
