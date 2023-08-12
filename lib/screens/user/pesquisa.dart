import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'especificacaoempresa.dart';

class Pesquisar extends StatefulWidget {
  const Pesquisar({super.key});

  @override
  State<Pesquisar> createState() => _PesquisarState();
}

class _PesquisarState extends State<Pesquisar> {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];
  List<String> titulos = [
    'Barbearia do seu zé',
    'Botique la vi',
    'Café dos Sonhos',
    'Livraria Encantada',
    'Academia Energia Vital',
  ];

  late List<bool> selectedStates;
  List<String> filteredNames = [];

  @override
  void initState() {
    super.initState();

    filteredNames = titulos;
    selectedStates = List.generate(filteredNames.length, (index) => false);
  }

  void filterNames(String query) {
    setState(() {
      filteredNames = titulos
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizew = MediaQuery.of(context).size.width;
    var sizeh = MediaQuery.of(context).size.height;

    void _showCustomContent(BuildContext context, Widget content) {
      showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });

          return AlertDialog(
            insetPadding: EdgeInsets.only(bottom: sizeh * .06),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.bottomCenter,
            content: Container(
              height: sizeh * .06,
              width: sizew * .95,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: sizew * .03),
                child: content,
              ),
            ),
            backgroundColor: Colors.white,
          );
        },
      );
    }

    // Define o estilo da barra de status como transparente
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Cor da barra de status transparente
      statusBarIconBrightness:
          Brightness.light, // Ícones da barra de status em branco
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      body: SafeArea(
        child: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                toolbarHeight: sizeh * .2,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Container(
                        width: sizew,
                        height: sizeh * .09,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 30,
                              left: sizew * .05,
                              child: Text(
                                'Buscar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              right: sizew * .05,
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: sizew * 0.95,
                        child: TextField(
                          onChanged: filterNames,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.store_rounded, color: Colors.black),
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
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    int adjustedIndex = index % titulos.length;
                    Color color = colors[adjustedIndex];
                    // String title = titulos[adjustedIndex];

                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0),
                        ),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EspecificacaoEmpresa();
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: sizeh * .12,
                        width: sizew,
                        child: Stack(
                          children: [
                            Positioned(
                              left: sizew * .02,
                              top: sizeh * .015,
                              bottom: sizeh * .015,
                              child: Container(
                                height: sizeh * .1,
                                width: sizew * .2,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(100),
                                ),
                              ),
                            ),
                            Positioned(
                              top: sizeh * .015,
                              left: sizew * .3,
                              child: Container(
                                child: Text(
                                  filteredNames[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: sizeh * .02,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Positioned(
                              top: sizeh * .05,
                              left: sizew * .3,
                              child: Container(
                                child: Text(
                                  'Barbearia',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: sizeh * .015,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: sizew * .095,
                              top: sizeh * .048,
                              child: Icon(
                                Icons.star_rate_rounded,
                                color: Colors.yellow,
                                size: sizeh * .015,
                              ),
                            ),
                            Positioned(
                              right: sizew * .055,
                              top: sizeh * .05,
                              child: Text(
                                '4.5',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: sizeh * .015,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Positioned(
                              left: sizew * .3,
                              bottom: sizeh * .03,
                              child: Icon(
                                Icons.check_circle_outline_rounded,
                                size: sizeh * .015,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              left: sizew * .34,
                              bottom: sizeh * .03,
                              child: Text(
                                'Aberto',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: sizeh * .015,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Positioned(
                              right: sizew * .085,
                              bottom: sizeh * .03,
                              child: Text(
                                '360Km',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: sizeh * .015,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Positioned(
                              right: sizew * .055,
                              bottom: sizeh * .03,
                              child: Icon(
                                Icons.call_made,
                                size: sizeh * .015,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              right: sizew * .055,
                              top: sizeh * .01,
                              child: Container(
                                height: sizeh * .025,
                                width: sizew * .055,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        // Altere apenas o estado do botão pressionado
                                        selectedStates[index] =
                                            !selectedStates[index];
                                      },
                                    );
                                    selectedStates[index]
                                        ? _showCustomContent(
                                            context,
                                            Text(
                                              'Você agora segue esse lugar.',
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: sizeh * .02,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          )
                                        : _showCustomContent(
                                            context,
                                            Text(
                                              'Você não segue mais esse lugar.',
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: sizeh * .02,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          );
                                  },
                                  child: AnimatedContainer(
                                    curve: Curves.fastOutSlowIn,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    duration: Duration(milliseconds: 5),
                                    child: selectedStates[index]
                                        ? Icon(Icons.remove, size: sizeh * .02)
                                        : Icon(Icons.add, size: sizeh * .02),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFF111111),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: filteredNames.length,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
