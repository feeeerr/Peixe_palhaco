import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';



// import 'package:front_end/cadastroemp.dart';
// import 'package:front_end/cadastropes.dart';
// import 'package:geolocator/geolocator.dart';


// void getCurrentLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
  
//   double latitude = position.latitude;
//   double longitude = position.longitude;
  
//   print('Latitude: $latitude');
//   print('Longitude: $longitude');
// }


class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/images/icon55.png',
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'horas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 190),
                  child: Text(
                    'Welcome to 55horas',
                    style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => Login(),));
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
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,  MaterialPageRoute(builder: (context) => cademp(),));
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
            ],
          ),
        ),
      ),
    );
  }
}
