import 'package:flutter/material.dart';
import 'package:patmus/authScreens/signin_screen.dart';
import 'package:patmus/authScreens/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  const Text(
          "Patmus Restaurant"
        ),
        centerTitle: true,
        bottom: const TabBar(
          tabs: [
            Tab(

              icon: Icon(Icons.lock, color: Colors.white, ),
              text: "SignIn",
            ),
             Tab(

              icon: Icon(Icons.person , color: Colors.white, ),
              text: "SignUp",
            ),
          
        ],
        indicatorColor: Colors.white38,
        indicatorWeight: 5,
        ),


      ),
      body:  Container(
        color: Colors.black87,
        child: const  TabBarView(
          children: [
                 SigninScreen(),
                 SignupScreen(),
        
          ]
   
        ) ,

      ),


    )
    );
  }
}