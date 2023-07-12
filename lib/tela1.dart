import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end/empsignup.dart';
import 'package:front_end/signup.dart';

//--------------------------------------------------------------------------------------------------------------

class MyApp extends StatelessWidget
 {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
//-------------------------------------------------------------------------------------------------------------- IMAGEM LOGO

              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/estabelecimento.svg',
                    height: 120,
                    width: 120,
                  ),
                ),  
              ),    
              
//-------------------------------------------------------------------------------------------------------------- NOME DO APP

              Container(
                child: Text(
                  '55Horas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),  
              
//-------------------------------------------------------------------------------------------------------------- TEXTO DE BEM VINDO

              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 190),
                  child: Text(
                    'Welcome to 55Horas',
                    style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
                  ),
                ),  
              ),    
              
//-------------------------------------------------------------------------------------------------------------- TEXTO EXPLICATIVO

              Container(
                padding: EdgeInsets.only(
                  left: 70,
                  right: 70,
                  bottom: 10,
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  textAlign: TextAlign.center,
                ),
              ),  
              
//-------------------------------------------------------------------------------------------------------------- BOTÃO PESSOA 

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => Signup(),));
                    print('clicou');
                  },
                  child: Text('PESSOA'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                ),  
              ),    
              
//-------------------------------------------------------------------------------------------------------------- BOTÃO ESTABELECIMENTO

              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => EmpSignUp(),));
                    print('clicou');
                  },
                  child: Text('ESTABELECIMENTO'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                ),  
              )     
              
//--------------------------------------------------------------------------------------------------------------

            ],
          ),
        ),  
      ),    
    );      
  }
}
