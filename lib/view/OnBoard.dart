import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'SignupScreen.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/11.jpg",
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
              child: Text(
                "WELCOME BACK",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    foreground: Paint()
                      ..shader = LinearGradient(colors: [
                        Color(0xffEB7600),
                        Color(0xff84D2DC),
                        Color(0xffA13638),
                        Color(0xffF0C4B6),
                      ]).createShader(Rect.fromLTWH(70, 70, 200, 10))),
              ),
            ),
            SizedBox(height: 500),
            MaterialButton(
              minWidth: 150,
              elevation: 0,
              color: Colors.yellow,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text(
                "SIGN IN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    foreground: Paint()
                      ..shader = LinearGradient(colors: [
                        Color(0xffEB7600),
                        Color(0xffA13638),
                        Color(0xff84D2DC),
                        Color(0xffF0C4B6),
                      ]).createShader(Rect.fromLTWH(70, 70, 200, 10))),
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
              minWidth: 150,
              elevation: 0,
              color: Colors.pink.shade300,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateScreen(),
                  ),
                );
              },
              child: Text(
                "SIGN UP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    foreground: Paint()
                      ..shader = LinearGradient(colors: [
                        Colors.black,
                        Colors.white,
                        Colors.blue,
                        Colors.cyanAccent
                      ]).createShader(Rect.fromLTWH(70, 70, 200, 10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
