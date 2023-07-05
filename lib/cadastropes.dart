import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end/entrarpes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<void> sendSign(em, us, pa) async {
//   var url = Uri.parse('http://192.168.0.181:9031/signup');

//   // Define the request body
//   var body = {
//     'Email': em,
//     'Username': us,
//     'Password': pa,
//   };

//   var jsonBody = jsonEncode(body);

//   var response = await http.post(url, body: jsonBody);

//   // Handle the response
//   if (response.statusCode == 200) {
//     // Request successful
//     print('POST request successful');
//     print('Response body: ${response.body}');
//   } else {
//     // Request failed
//     print('POST request failed with status code ${response.statusCode}');
//     print('Response body: ${response.body}');
//   }
// }

class cadpes extends StatefulWidget {
  const cadpes({Key? key});

  @override
  State<cadpes> createState() => _cadpesState();
  
}

class _cadpesState extends State<cadpes> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

    @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2120),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFF1C2120),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowGlow(); // Disables scroll glow effect
              return true;
            },
            child: ListView(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 75, top: 63),
                        child: Container(
                          child: SvgPicture.asset(
                            'assets/images/estabelecimento.svg',
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 580,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(70),
                    ),
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
                            controller: nomeController,
                            decoration: InputDecoration(
                              hintText: 'José Martins',
                              filled: true,
                              fillColor: Color.fromARGB(255, 235, 235, 235),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
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
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'josemartins@exemplo.com',
                              filled: true,
                              fillColor: Color.fromARGB(255, 235, 235, 235),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
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
                            controller: senhaController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '******',
                              filled: true,
                              fillColor: Color.fromARGB(255, 235, 235, 235),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          String nome = nomeController.text;
                          String email = emailController.text;
                          String senha = senhaController.text;
                          print('Nome: $nome');
                          print('Email: $email');
                          print('Senha: $senha');
                         // sendSign(email, nome, senha);
                        },
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
                              builder: (context) => loginpes(),
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
                          bottom: 30,
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
                                    MaterialStateProperty.all<Size>(Size(60, 60)),
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
                                    MaterialStateProperty.all<Size>(Size(60, 60)),
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
                                    MaterialStateProperty.all<Size>(Size(60, 60)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
