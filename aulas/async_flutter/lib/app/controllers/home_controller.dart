import 'dart:developer';

import 'package:async_flutter/app/models/json_model.dart';
import 'package:async_flutter/app/repositories/json_model_repository.dart';
import 'package:flutter/material.dart';

class HomeControler {
  List<TodoModel> todos = [];
  final TodoRepository repository = TodoRepository();
  //HomeState state = HomeState.start;
  final ValueNotifier<HomeState> state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;

    try {
      todos = await repository.fetchTodos();
      state.value = HomeState.sucess;

      // throw Error();
    } catch (e) {
      state.value = HomeState.error;
      log(e.toString());
    }

    //return response;
  }
}

enum HomeState { start, loading, sucess, error }
