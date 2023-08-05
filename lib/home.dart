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

  bool _isAppBarVisible = true;

  void _toggleAppBarVisibility() {
    setState(() {
      _isAppBarVisible = !_isAppBarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      // shape: ContinuousRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.circular(30),
      //   ),
      // ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1C2120),
          borderRadius: _isAppBarVisible
              ? BorderRadiusDirectional.only(bottomStart: Radius.circular(12))
              : BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Lugares próximos',
            style: TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            onPressed: _toggleAppBarVisibility,
            child: Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0)),
          )
        ],
      ),
      backgroundColor: Colors.black.withOpacity(0),
      elevation: 0,
    );

    var size = MediaQuery.of(context).size;
    var sizeh = size.height - appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: sizeh * .945,
            decoration: BoxDecoration(
              color: Color(0xFF1C2120),
              borderRadius: _isAppBarVisible
                  ? BorderRadiusDirectional.only(topStart: Radius.circular(12))
                  : BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: CustomScrollView(
              slivers: [
                if (_isAppBarVisible)
                  SliverAppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    toolbarHeight: 30,
                    floating: true,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 50,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 5, top: 5, bottom: 5),
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(70),
                                ),
                                child: Center(
                                  child: Text('$index',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      List<Color> colors = [
                        Colors.red,
                        Colors.green,
                        Colors.blue,
                        Colors.orange,
                        Colors.purple,
                      ];

                      Color color = colors[index % colors.length];

                      return ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.black.withOpacity(0)),
                            elevation: MaterialStateProperty.all(0)),
                        onPressed: () {},
                        child: Container(
                          height: sizeh * .15,
                          width: size.width,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 12,
                                bottom: 12,
                                left: 10,
                                child: Container(
                                  height: sizeh * .1,
                                  width: size.width * .24,
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(100),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 120,
                                child: Container(
                                  child: Text('Barbearia sla'),
                                ),
                              ),
                              Positioned(
                                bottom: 55,
                                left: 120,
                                child: Container(
                                  child: Text('Barbearia'),
                                ),
                              ),
                              Positioned(
                                right: 40,
                                bottom: 55,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.yellow,
                                          size: 18,
                                        ),
                                      ),
                                      TextSpan(
                                          text: '4.5',
                                          style: TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 120,
                                bottom: 30,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.check_circle_outline_rounded,
                                          size: 15,
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'Aberto',
                                          style: TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                bottom: 30,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '360Km',
                                          style: TextStyle(fontSize: 13)),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.call_made,
                                          size: 12,
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
                    },
                    childCount: 50,
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
