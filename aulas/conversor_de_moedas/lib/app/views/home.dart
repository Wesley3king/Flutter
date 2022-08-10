import 'package:conversor_de_moedas/app/views/dropdow_select.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/imgs/currency-icon.png', width: 170,height: 170,),
                const SizedBox(height: 50,),

                const CustomSelectWidget(),
                const SizedBox(height: 10,),
                const CustomSelectWidget(),
                //Select(),
                const SizedBox(width: 10,),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 194, 149, 16))),
                  onPressed: () {

                  },
                child: const Text('Converter',style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              ],
            ),
         ),
       
    );
  }
}
