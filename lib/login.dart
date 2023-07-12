import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end/signup.dart';
import 'package:front_end/intro.dart';

class loginpes extends StatefulWidget {
  const loginpes({Key? key});

  @override
  State<loginpes> createState() => _loginpesState();
}

class _loginpesState extends State<loginpes> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState<String>> emailKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> senhaKey =
      GlobalKey<FormFieldState<String>>();

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  void _submitForm2() {
    if (_formKey.currentState!.validate()) {
      String email = emailKey.currentState!.value!;
      String senha = senhaKey.currentState!.value!;

      print('Email: $email');
      print('Senha: $senha');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => intro()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2120),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
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
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _submitForm2,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
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
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                      print('ooooooo');
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('ooooooo');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
