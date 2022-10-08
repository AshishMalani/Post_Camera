import 'dart:async';

import 'package:flutter/material.dart';
import 'package:post_cemera/view/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignupScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? Username;
  @override
  void initState() {
    getUsername().whenComplete(
      () => Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Username == null ? CreateScreen() : LoginScreen(),
          ),
        ),
      ),
    );
    super.initState();
  }

  Future getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString("username");
    setState(() {
      Username = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("SplashScreen",
          style: TextStyle(decoration: TextDecoration.none),
          textScaleFactor: 0.8),
    );
  }
}
