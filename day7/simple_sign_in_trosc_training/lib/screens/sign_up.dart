import 'package:flutter/material.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Sign up Page',
        style: TextStyle(
          fontSize: 50,
          color: Colors.black
        ),
      ),
    );
  }
}