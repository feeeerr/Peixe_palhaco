import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end/entrarpes.dart';

class cadpes extends StatefulWidget {
  const cadpes({super.key});

  @override
  State<cadpes> createState() => _cadpesState();
}

class _cadpesState extends State<cadpes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2120),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFF1C2120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 75),
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/images/estabelecimento.svg',
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),

                ],
              ),
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadiusDirectional.only(topEnd: Radius.circular(70)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 45),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Sign up to continue.',
                        style: TextStyle(
                            color: Color.fromARGB(255, 130, 132, 133),
                            fontSize: 12.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: 50,
                      ),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          border: InputBorder.none,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'José Martins',
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: 50,
                      ),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Email ou Telefone',
                          border: InputBorder.none,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'josemartins@exemplo.com',
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 10),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: InputBorder.none,
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '******',
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
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(290, 50)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => entpes(),
                          ),
                        );
                        print('ooooooo');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 40,
                        right: 50,
                        left: 50,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print('puta');
                            },
                            child: Icon(Icons.adb),
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all<Size>(Size(70, 70)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print('puta');
                            },
                            child: Icon(Icons.adb),
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all<Size>(Size(70, 70)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print('puta');
                            },
                            child: Icon(Icons.adb),
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all<Size>(Size(70, 70)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
