import 'package:flutter/material.dart';

Widget botoes( child1, child2) {
  var sizeh;

  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      elevation: MaterialStatePropertyAll(
        0,
      ),
    ),
    onPressed: () {
      print('foiiii');
    },
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
                      padding: EdgeInsets.only(bottom: 10, top: 30),
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
  );
}

final Estilo =
    TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white);

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;

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
              child: botoes(
                  Text(
                    'Meus dados',
                    style: Estilo,
                    softWrap: false,
                  ),
                  Text(
                    'E-mail, senha, Nome de Usuário, localização... ',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    softWrap: false,
                  ),),
            ),
            SliverToBoxAdapter(
              child: botoes(
                  Text(
                    'Sair',
                    style: Estilo,
                    softWrap: false,
                  ),
                  Text(
                    'Fazer logout',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    softWrap: false,
                  ),),
            ),
          ],
        ),
      ),
    );
  }
}
