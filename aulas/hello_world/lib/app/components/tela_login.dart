import 'package:flutter/material.dart';

class LoginDesafio extends StatelessWidget {
  const LoginDesafio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 112, 102),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/imgs/tinder-icon.png'),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Location Changer',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text('Plugin app for Tinder',
                style: TextStyle(color: Colors.white)),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color.fromARGB(255, 179, 179, 179);
                      } else {
                        return Colors.white;
                      }
                    }),
                    ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                child: const Text('Login with Facebook',
                    style:
                        TextStyle(color: Color.fromARGB(255, 241, 112, 102))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
