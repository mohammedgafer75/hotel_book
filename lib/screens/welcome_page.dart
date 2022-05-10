import 'package:flutter/material.dart';
import 'package:hotel_book/screens/sign_in.dart';
import 'package:hotel_book/screens/sign_up.dart';

import 'background-image.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackgroundImage(image: 'images/back.jpg'),
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Image.asset(
                    'images/logo.png',
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    'Hotel Book ❤',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent),
                  )
                ],
              ),
            ),
            Center(
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(
                        top: 10, bottom: 10, left: 60, right: 60)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow[900]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: const Text(
                  'sign in ',
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
            ),
            Center(
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(
                        top: 10, bottom: 10, left: 60, right: 60)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellow[900]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: const Text(
                  'sign up',
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
