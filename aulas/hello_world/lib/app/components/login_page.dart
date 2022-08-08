import 'package:flutter/material.dart';
import 'package:hello_world/app/components/home_page.dart';

class MyWidgetHome extends StatefulWidget {
  const MyWidgetHome({Key? key}) : super(key: key);

  @override
  State<MyWidgetHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidgetHome> {

  Widget _body() {
    return SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: 360,
                    height: 450,
                    child: Image.asset('assets/imgs/konosuba.webp'),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 11.0, bottom: 11.0),
                        child: Column(
                          children: [
                          const SizedBox(height: 10),
                          TextField(
                            // aqui recebemos o valor do input
                            onChanged: (value) {
                              print(value);
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(), labelText: 'Email'),
                          ),
                          const SizedBox(height: 10),
                          const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), labelText: 'texto'),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed('/home');
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.blue),
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('login', textAlign: TextAlign.center,),)
                          ) ,
                        ]),
                      ),
                    ),
                ],
              ),
            )),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/imgs/konosuba.webp', fit: BoxFit.cover,),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          _body(),
        ],
      )
    );
  }
}
