import 'package:flutter/material.dart';

class pesqui extends StatefulWidget {
  const pesqui({super.key});

  @override
  State<pesqui> createState() => _pesquiState();
}

class _pesquiState extends State<pesqui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: InputDecorator(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar',
                    filled: true,
                    fillColor: Color.fromARGB(255, 235, 235, 235),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
