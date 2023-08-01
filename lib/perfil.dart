import 'package:flutter/material.dart';

Widget Horarios() {
  return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          // Ação ao pressionar o botão
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[350], // Cor de fundo cinza
          padding: EdgeInsets.all(35), // Espaçamento interno do botão
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
              Column(crossAxisAlignment: CrossAxisAlignment.start,
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
      onTap: () { print('foiiii');},
      child: Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.black, width: 0.5),
                        bottom: BorderSide(color: Colors.black, width: 0.5)),
                  ),
                  child: Stack(children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 300,
                                  height: 100,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 30),
                                      child: Container(
                                        child: Column(
                                          children: [child1, child2],
                                        ),
                                      ),
                                    )
                                  ]))
                            ]))
                  ])))));
}

final Estilo = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          width: 300,
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.account_circle, size: 75),
              Text(
                'Nome do cliente',
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        tilapia(
          Text(
            'Meus dados',
            style: Estilo,
            softWrap: false,
          ),
          Text(
            'E-mail, senha, Nome de Usuário, localização... ',
            style: TextStyle(fontSize: 12),
            softWrap: false,
          ),
        ),
        tilapia(
          Text(
            'Sair',
            style: Estilo,
            softWrap: false,
          ),
          Text(
            'Fazer logout',
            style: TextStyle(fontSize: 12),
            softWrap: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: Text(
            'Horarios marcados',
            style: Estilo,
            softWrap: false,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Horarios();
            },
          ),
        )
      ],
    )));
  }
}
