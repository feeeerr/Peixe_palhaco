import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'info.dart';
import 'hive-model.dart';
import 'intro.dart';
import 'hive-service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<void> sendLocation() async {
  var url = Uri.parse('http://192.168.0.181:9031/nearby');
  WidgetsFlutterBinding.ensureInitialized();
      final hiveService = await HiveService.getInstance();
      final infoBox = hiveService?.infoBox;
      final info = infoBox?.getAt(0) as Info?;
      double? x = null;
      double? y = null;
      if (info != null ) {
        x = info.cord_x;
        y = info.cord_y;
      }
  // Define the request body
  var body = {
    'cord_x': x,
    'cord_y': y
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


Future<List<double>> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  double latitude = position.latitude;
  double longitude = position.longitude;

  return [latitude, longitude];
}

void setFirstTime() async {
  final hiveService = await HiveService.getInstance();
  final infoBox = hiveService?.infoBox;
  if (infoBox != null) {
    final info = infoBox.getAt(0) as Info?;
    if (info != null) {
      List<double> values = await getCurrentLocation();
      info.cord_x = values[0];
      info.cord_y = values[1];
      info.firstTime = false; // Update the hasLoggedIn variable
      infoBox.put(0, info); // Save the updated user object back to the Hive box
    }
  }
  sendLocation();
}

Widget peixe(child) {
  return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: Container(
        width: 70,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(70)),
        ),
        child: Center(child: child,),
      ));
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState()  {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      WidgetsFlutterBinding.ensureInitialized();
      final hiveService = await HiveService.getInstance();
      final infoBox = hiveService?.infoBox;
      final info = infoBox?.getAt(0) as Info?;
      
      if (info != null ) {
        if (info.firstTime) {
          _showPopupDialog(); 
        }
      }
      
     
    });
  }

  void _requestLocationPermission() async {
      final status = await Permission.location.request();
      if (status.isGranted) {
        getCurrentLocation(); // Permission granted, show the dialog
      }
      

    }

  void _showPopupDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.SCALE,
      title: 'Localização',
      desc: 'Forneça sua localização atual \npara que a 55 possa te mostrar estabelecimentos próximos',
      btnCancelOnPress: () {},
      btnOkOnPress: () {_requestLocationPermission(); setFirstTime();},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  peixe(Text('1', style: TextStyle(color: Colors.white))),
                  peixe(Text('2', style: TextStyle(color: Colors.white))),
                  peixe(Text('3', style: TextStyle(color: Colors.white))),
                  peixe(Text('4', style: TextStyle(color: Colors.white))),
                  peixe(Text('5', style: TextStyle(color: Colors.white))),
                  peixe(Text('6', style: TextStyle(color: Colors.white))),
                  peixe(Text('7', style: TextStyle(color: Colors.white))),
                  
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowGlow(); // Disables scroll glow effect
                return true;
              },
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 20, top: 10, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Container(
                                      child: SvgPicture.asset(
                                        'assets/images/iconeBarbearia.svg',
                                        height: 100,
                                        width: 90,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Container(
                                              child: Text('Shell Sofa'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text('Tipo'),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '326Km',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    Icon(
                                                      Icons.call_made,
                                                      size: 12,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      size: 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text('Aberto'),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
