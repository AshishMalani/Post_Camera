import 'package:flutter/material.dart';
import 'package:post_cemera/view/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Hello Flutter",
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove("usirname").then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                  );
            },
            child: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
