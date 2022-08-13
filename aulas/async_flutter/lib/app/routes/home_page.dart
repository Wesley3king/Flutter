import 'package:async_flutter/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeControler controller = HomeControler();

  Widget _start() {
    return const Center(
      child: Text('Iniciando...'),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _sucess() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var item = controller.todos[index];
        String title = item.title ?? "Nullo";
        return ListTile(
          leading: Checkbox(
            value: item.completed,
            onChanged: (value) {},
          ),
          title: Text(title),
        );
      },
    );
  }

  Widget _error() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'ERROR: erro ao buscar items!',
            style: TextStyle(color: Colors.red),
          ),
          ElevatedButton(
              onPressed: () {
                controller.start();
              },
              child: const Text('Tentar novamente')),
        ],
      ),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.sucess:
        return _sucess();
      case HomeState.error:
        return _error();
      default:
        return _error();
    }
  }

  @override
  void initState() {
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('async dart'),
        actions: [
          IconButton(
              onPressed: () {
                controller.start();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) => stateManagement(controller.state.value),
      ),
    );
  }
}
