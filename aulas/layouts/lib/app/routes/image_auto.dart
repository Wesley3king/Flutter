import 'package:flutter/material.dart';

class MyImageAuto extends StatefulWidget {
  const MyImageAuto({Key? key}) : super(key: key);

  @override
  State<MyImageAuto> createState() => _MyImageAutoState();
}

class _MyImageAutoState extends State<MyImageAuto> {
  
// zoom
 

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5.0,
        child: Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
          child: Container(
            width: 300,
            color: Colors.blue,
            child: ListView(
              children: [
                IntrinsicHeight(
                  child: Image.network(
                    'https://images.pexels.com/photos/1979828/pexels-photo-1979828.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                    //fit: BoxFit.contain,
                  ),
                ),
                IntrinsicHeight(
                  child: Image.network(
                    'https://images.pexels.com/photos/5472601/pexels-photo-5472601.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                    //fit: BoxFit.contain,
                  ),
                ),
                IntrinsicHeight(
                  child: Image.network(
                    'https://images.pexels.com/photos/3048524/pexels-photo-3048524.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                    //fit: BoxFit.contain,
                  ),
                ),
                IntrinsicHeight(
                  child: Image.network(
                    'https://images.pexels.com/photos/2385898/pexels-photo-2385898.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    //fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
/*
child: ListView(
        children: [
          IntrinsicHeight(
              child: Image.network('https://images.pexels.com/photos/1979828/pexels-photo-1979828.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
              //fit: BoxFit.contain,
              ),
            ),
          IntrinsicHeight(
              child: Image.network('https://images.pexels.com/photos/5472601/pexels-photo-5472601.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
              //fit: BoxFit.contain,
              ),
            ),
            IntrinsicHeight(
              child: Image.network('https://images.pexels.com/photos/3048524/pexels-photo-3048524.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
              //fit: BoxFit.contain,
              ),
            ),
            IntrinsicHeight(
              child: Image.network('https://images.pexels.com/photos/2385898/pexels-photo-2385898.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              //fit: BoxFit.contain,
              ),
            ),
        ],
      )
      */