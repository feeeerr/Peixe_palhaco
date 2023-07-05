import 'package:flutter/material.dart';

class cademp extends StatefulWidget {
  const cademp({super.key});

  @override
  State<cademp> createState() => _cadempState();
}

class _cadempState extends State<cademp> {
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