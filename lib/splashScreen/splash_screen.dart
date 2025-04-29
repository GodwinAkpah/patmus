import 'dart:async';

import 'package:flutter/material.dart';
import 'package:patmus/authScreens/auth_screen.dart';
import 'package:patmus/mainScreens/home_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  initTimer(){
     Timer(

        const Duration( seconds: 3),

       () async{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AuthScreen(),));

       }
     );
  }
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "images/burger.jpg"
              ),
            ),
          const Text(
              "sellers App",
              style: TextStyle(
                letterSpacing: 3,
                fontSize:26,
                color:Colors.grey,
              ),
            )


          ],

        ),
      ),
    );
  }
}