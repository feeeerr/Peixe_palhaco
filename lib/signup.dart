import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end/intro.dart';
import 'package:front_end/login.dart';
import 'package:front_end/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'info.dart';
import 'hive-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'info.dart';
import 'hive-model.dart';
import 'hive-service.dart';

//--------------------------------------------------------------------------------------------------------------

void setLogged(nome, email, senha) async {
  final hiveService = await HiveService.getInstance();
  final infoBox = hiveService?.infoBox;
  if (infoBox != null) {
    final info = infoBox.getAt(0) as Info?;
    if (info != null) {
      info.isLogged = true;
      info.name = nome;
      info.email = email;
      info.password = senha;
      infoBox.put(0, info); // Save the updated user object back to the Hive box
    }
  }
}

//--------------------------------------------------------------------------------------------------------------

Future<void> sendSign(em, us, pa) async {
  var url = Uri.parse('http://192.168.0.181:9031/signup');

  // Define the request body
  var body = {
    'Email': em,
    'Username': us,
    'Password': pa,
  };

  var jsonBody = jsonEncode(body);

  var response = await http.post(url, body: jsonBody);

  // Handle the response
  if (response.statusCode == 200) {
    // Request successful
    print('POST request successful');
    print('Response body: ${response.body}');
  } else {
    // Request failed
    print('POST request failed with status code ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

//--------------------------------------------------------------------------------------------------------------

class Signup extends StatefulWidget {
  const Signup({Key? key});

  @override
  State<Signup> createState() => _SignupState();
}

//--------------------------------------------------------------------------------------------------------------

class _SignupState extends State<Signup> // ENGLOBA TUDO
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState<String>> nomeKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> emailKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> senhaKey =
      GlobalKey<FormFieldState<String>>();

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

//--------------------------------------------------------------------------------------------------------------

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String nome = nomeKey.currentState!.value!;
      String email = emailKey.currentState!.value!;
      String senha = senhaKey.currentState!.value!;

      setLogged(nome, email, senha);
      print('Nome: $nome');
      print('Email: $email');
      print('Senha: $senha');
      sendSign(email, nome, senha);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => intro()),
      );
    }
  }

//--------------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
//----------------------------------------------------------------------------------------------  TELA DE FUNDO

    return Scaffold(
      backgroundColor: Color(0xFF1C2120),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFF1C2120),

//----------------------------------------------------------------------------------------------

          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowGlow(); // Disables scroll glow effect
              return true;
            },
            child: ListView(
              // ENGLOBA TUDO
              children: [
//-------------------------------------------------------------------------------------------------------------- IMAGEM 'LOGO'

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

//-------------------------------------------------------------------------------------------------------------- PARTE BRANCA

                Container(
                  width: double.infinity,
                  height: 580,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(70),
                    ),
                  ),

//--------------------------------------------------------------------------------------------------------------

                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
//-------------------------------------------------------------------------------------------------------------- TEXTO ESCRITO SIGNUP

                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 20),
                          child: Container(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                              ),
                            ),
                          ),
                        ),

                        //-------------------------------------------------------------------------------------------------------------- TEXTO ESCRITO SIGNUP TO CONTINUE

                        Container(
                          child: Text(
                            'Sign up to continue.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 130, 132, 133),
                              fontSize: 12.5,
                            ),
                          ),
                        ),

//-------------------------------------------------------------------------------------------------------------- TextFormField NOME

                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              border: InputBorder.none,
                            ),
                            child: TextFormField(
                              key: nomeKey,
                              controller: nomeController,
                              validator: (value) {
                                if (value == null || value.length < 1) {
                                  return 'Nome não pode ser vazio.';
                                }
                              },
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

//-------------------------------------------------------------------------------------------------------------- TextFormField EMAIL

                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: InputBorder.none,
                            ),
                            child: TextFormField(
                              key: emailKey,
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Insira um email.';
                                }
                                // Expressão regular para verificar se o valor contém algum texto antes dos domínios especificados
                                final emailRegex = RegExp(
                                    r'^.+@(yahoo\.com\.br|yahoo\.com|gmail\.com)$');
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Insira um email válido que termine com @gmail.com, @yahoo.com ou @yahoo.com.br.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'josemartins@gmail.com',
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

//-------------------------------------------------------------------------------------------------------------- TextFormField SENHA

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, bottom: 10),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              border: InputBorder.none,
                            ),
                            child: TextFormField(
                              key: senhaKey,
                              controller: senhaController,
                              validator: (value) {
                                if (value == null || value.length < 8) {
                                  return 'Insira pelo menos 8 caracteres.';
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: '********',
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

//-------------------------------------------------------------------------------------------------------------- BOTÃO 'SIGN UP' LEVA PARA PROXIMA PAGINA

                        ElevatedButton(
                          onPressed: _submitForm,
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

//-------------------------------------------------------------------------------------------------------------- BOTÃO 'LOGIN' LEVA PARA O LOGIN

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginpes()),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

//--------------------------------------------------------------------------------------------------------------

                      ],
                    ),
                  ),
                ),
              ], // Children
            ),
          ),
        ),
      ),
    );
  } // widget
} // class
