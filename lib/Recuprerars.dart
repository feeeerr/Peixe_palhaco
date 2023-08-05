import 'package:front_end/tela1.dart';
import 'package:flutter/material.dart';


class RecuperarS extends StatefulWidget {
  const RecuperarS({super.key});

  @override
  State<RecuperarS> createState() => _RecuperarSState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final GlobalKey<FormFieldState<String>> emailKey =
    GlobalKey<FormFieldState<String>>();

class _RecuperarSState extends State<RecuperarS> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    void _submitForm() {
      if (_formKey.currentState!.validate()) {
        String email = emailKey.currentState!.value!;

        print('Email: $email');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => (MyApp())),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * .85,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Adicione seu email',
                      border: InputBorder.none,
                    ),
                    child: TextFormField(
                      key: emailKey,
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
                        hintText: 'Ex: josemartins@gmail.com',
                        filled: true,
                        fillColor: Color.fromARGB(255, 235, 235, 235),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Recuperar senha',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(
                        size.width * .425,
                        size.height * .05,
                      ),
                    ),
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
        ),
      ),
    );
  }
}
