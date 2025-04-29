import 'package:flutter/material.dart';
import 'package:patmus/widgets/custom_text_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();


    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "images/burger.jpg",
              height: 200,
              width: 200,
            ),
            
          ),
      Form(
        key: formKey,
        child: Column(
          children: [
             CustomTextField(
            textEditingController: emailTextEditingController ,
            hintString: "Email",
            iconData: Icons.email,
            isObscure: false,
            enabled: true,
          ),
          const SizedBox(height: 10,),
          CustomTextField(
            textEditingController: passwordTextEditingController ,
            hintString: "Password",
            iconData: Icons.lock,
            isObscure: true,
            enabled: true,
          ),
          const SizedBox(height: 10,),

          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Perform sign-in action
              }
            },
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
            child: const Text("Sign In" ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10,),


          ] 
         
        ))




        ],
      ),
    );
  
  }
}