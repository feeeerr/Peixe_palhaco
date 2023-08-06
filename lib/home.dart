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
  if (info != null) {
    x = info.cord_x;
    y = info.cord_y;
  }
  // Define the request body
  var body = {'cord_x': x, 'cord_y': y};

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

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      WidgetsFlutterBinding.ensureInitialized();
      final hiveService = await HiveService.getInstance();
      final infoBox = hiveService?.infoBox;
      final info = infoBox?.getAt(0) as Info?;

      if (info != null) {
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
      desc:
          'Forneça sua localização atual \npara que a 55 possa te mostrar estabelecimentos próximos',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        _requestLocationPermission();
        setFirstTime();
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;

    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
    ];

    List<Text> titulos = [
      Text(
        'Barbearia do seu zé',
        style: TextStyle(
            color: Colors.white,
            fontSize: sizeh * .02,
            fontWeight: FontWeight.w400),
      ),
      Text(
        'Botique la vi',
        style: TextStyle(
            color: Colors.white,
            fontSize: sizeh * .02,
            fontWeight: FontWeight.w400),
      ),
      Text(
        'Café dos Sonhos',
        style: TextStyle(
            color: Colors.white,
            fontSize: sizeh * .02,
            fontWeight: FontWeight.w400),
      ),
      Text(
        'Livraria Encantada',
        style: TextStyle(
            color: Colors.white,
            fontSize: sizeh * .02,
            fontWeight: FontWeight.w400),
      ),
      Text(
        'Academia Energia Vital',
        style: TextStyle(
            color: Colors.white,
            fontSize: sizeh * .02,
            fontWeight: FontWeight.w400),
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: sizeh * .8,
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            int adjustedIndex = index % titulos.length;
                            Color color = colors[adjustedIndex];
                            Text title = titulos[adjustedIndex];

                            return ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black.withOpacity(0),
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              onPressed: () {},
                              child: Container(
                                height: sizeh * .12,
                                width: sizew,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: sizew * .02,
                                      top: sizeh * .015,
                                      bottom: sizeh * .015,
                                      child: Container(
                                        height: sizeh * .1,
                                        width: sizew * .2,
                                        decoration: BoxDecoration(
                                          color: color,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  100),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: sizeh * .015,
                                      left: sizew * .3,
                                      child: Container(
                                        child: title,
                                      ),
                                    ),
                                    Positioned(
                                      top: sizeh * .05,
                                      left: sizew * .3,
                                      child: Container(
                                        child: Text(
                                          'Barbearia',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: sizeh * .015,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: sizew * .15,
                                      top: sizeh * .05,
                                      child: Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.yellow,
                                        size: sizeh * .015,
                                      ),
                                    ),
                                    Positioned(
                                      right: sizew * .11,
                                      top: sizeh * .05,
                                      child: Text(
                                        '4.5',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: sizeh * .015,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: sizew * .3,
                                      bottom: sizeh * .03,
                                      child: Icon(
                                        Icons.check_circle_outline_rounded,
                                        size: sizeh * .015,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Positioned(
                                      left: sizew * .34,
                                      bottom: sizeh * .03,
                                      child: Text(
                                        'Aberto',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: sizeh * .015,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: sizew * .085,
                                      bottom: sizeh * .03,
                                      child: Text(
                                        '360Km',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: sizeh * .015,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: sizew * .055,
                                      bottom: sizeh * .03,
                                      child: Icon(
                                        Icons.call_made,
                                        size: sizeh * .015,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: sizew,
                height: sizeh * .15,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 22, 22, 22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0, 4), // Deslocamento vertical para baixo
                      blurRadius: 2, // Valor do desfoque da sombra
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: sizeh * .03,
                      left: sizew * .03,
                      child: Text(
                        'Lugares próximos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeh * .03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: sizeh * .01,
                      child: Container(
                        height: sizeh * .03,
                        width: sizew,
                        child: CustomScrollView(
                          scrollDirection: Axis.horizontal,
                          slivers: [
                            SliverToBoxAdapter(
                              // Adicione este SliverToBoxAdapter
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: sizew * .025),
                                child: Row(
                                  children: List.generate(30, (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: sizew * .025,
                                      ),
                                      child: Container(
                                        width: sizew * .2,
                                        height: sizeh * .03,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  70),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$index',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: sizeh * .02,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
