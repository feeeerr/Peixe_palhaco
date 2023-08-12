import 'package:flutter/material.dart';

Widget Horarios() {
  return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 40, 40, 40),
          padding: EdgeInsets.all(35), 
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '20:30',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'sexta-feira 27/07',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Barbearia',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Corte',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ));
}

Widget tilapia(child1, child2) {
  return GestureDetector(
    onTap: () {
      print('foiiii');
    },
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 20),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.white, width: 0.5),
                bottom: BorderSide(color: Colors.white, width: 0.5)),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 30),
                            child: Container(
                              child: Column(
                                children: [child1, child2],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

final Estilo =
    TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white);

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 22, 22, 22),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SizedBox(
                  width: 300,
                  height: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 75,
                        color: Colors.white,
                      ),
                      Text(
                        'Nome do cliente',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: tilapia(
                  Text(
                    'Meus dados',
                    style: Estilo,
                    softWrap: false,
                  ),
                  Text(
                    'E-mail, senha, Nome de Usuário, localização... ',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    softWrap: false,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: tilapia(
                  Text(
                    'Sair',
                    style: Estilo,
                    softWrap: false,
                  ),
                  Text(
                    'Fazer logout',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    softWrap: false,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Center(
                    child: Text(
                      'Horarios marcados',
                      style: Estilo,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Horarios();
                  },
                  childCount: 50,
                ),
              )
            ],
          ),
        ),
        );
  }
}
