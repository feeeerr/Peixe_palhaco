import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EspecificacaoEmpresa extends StatefulWidget {
  const EspecificacaoEmpresa({Key? key});

  @override
  State<EspecificacaoEmpresa> createState() => _EspecificacaoEmpresaState();
}

class _EspecificacaoEmpresaState extends State<EspecificacaoEmpresa> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Cor da barra de status transparente
      statusBarIconBrightness: Brightness.light, // Ícones da barra de status em branco
    ));

    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: sizeh,
        width: sizew,
        color: Colors.deepPurpleAccent,
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}