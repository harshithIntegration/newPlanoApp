import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ono/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // Navigate to the next screen after 5 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => dashboard(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Big logo
                Image.asset(
                  'assets/icons/log.png',
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 20, // Adjust the position as needed
            left: MediaQuery.of(context).size.width / 4 -
                25, // Adjust the position to center horizontally
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/Quantum_Logo.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Powered by Quantum Paradigm',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ], // <-- Make sure this closing bracket is in the correct position
      ),
    );
  }
}
