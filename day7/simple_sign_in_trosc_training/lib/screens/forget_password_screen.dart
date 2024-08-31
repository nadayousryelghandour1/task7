import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget{
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Forget Password Page',
        style: TextStyle(
          fontSize: 50,
          color: Colors.black
        ),
      ),
    );
  }
}