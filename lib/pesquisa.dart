import 'package:flutter/material.dart';

//-------------------------------------------------------------------------------------------------------------- CLASS

class Pesquisar extends StatefulWidget
 {
  const Pesquisar({super.key});

  @override
  State<Pesquisar> createState() => _PesquisarState();
}

class _PesquisarState extends State<Pesquisar>
 {
  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            
//-------------------------------------------------------------------------------------------------------------- PESQUISA

            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: InputDecorator(
                decoration: InputDecoration(
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
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
                        
//--------------------------------------------------------------------------------------------------------------

          ],
        ),
      ),
    );
  }
}
