import 'package:flutter/material.dart';

class EmpSignUp extends StatefulWidget {
  const EmpSignUp({super.key});

  @override
  State<EmpSignUp> createState() => _EmpSignUpState();
}

class _EmpSignUpState extends State<EmpSignUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(child: Text('empresa'),)
          ],
        ),
      )),
    );
  }
}