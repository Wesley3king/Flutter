import 'package:conversor_de_moedas/app/views/dropdow_select.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/currency-icon.png', width: 150,height: 150,),
            const CustomSelectWidget(),
            //Select(),
            const SizedBox(width: 10,),
            ElevatedButton(
              onPressed: () {

              },
             child: const Text('Converter',style: TextStyle(
              color: Colors.white,
             ),),
              ),
          ],
        ),
      )
    );
  }
}
