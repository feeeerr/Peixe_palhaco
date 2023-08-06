import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pesquisar extends StatefulWidget {
  const Pesquisar({super.key});

  @override
  State<Pesquisar> createState() => _PesquisarState();
}

class _PesquisarState extends State<Pesquisar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // Define o estilo da barra de status como transparente
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Cor da barra de status transparente
      statusBarIconBrightness:
          Brightness.light, // Ícones da barra de status em branco
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              toolbarHeight: size.height * .2,
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * .09,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          left: size.width * .05,
                          child: Text(
                            'Buscar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: size.width * .05,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.store_rounded, color: Colors.black),
                        hintText: 'Pesquisar',
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
