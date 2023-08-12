import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
// screens
import 'screens/user/intro.dart';
import 'screens/user/start.dart';

// variaveis locais
bool _isLogged = false;
bool _isLocated = false;
String _email = '';
String _name = '';
String _serializedRecents = '';
String _serializedAppointments = '';
String _serializedLiked = '';

// variaveis locais
Future<void> _initializeLocalVariables() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _isLogged = prefs.getBool('is_logged') ?? false;
  _isLocated = prefs.getBool('is_located') ?? false;
  _email = prefs.getString('email') ?? 'not logged';
  _name = prefs.getString('name') ?? 'not logged';
  _serializedRecents = prefs.getString('serialized_recents') ?? '[]';
  _serializedAppointments = prefs.getString('serialized_appointments') ?? '[]';
  _serializedLiked = prefs.getString('serialized_liked') ?? '[]';
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized first.

  await _initializeLocalVariables(); // inicializa as variaveis locais

  runApp(_isLogged ? MaterialApp(
    theme: ThemeData(
      fontFamily: 'Telegraf',
    ),
    debugShowCheckedModeBanner: false, 
    home: Intro()
    ) : 
    MaterialApp(
      theme: ThemeData(
      fontFamily: 'Telegraf',
    ),
      routes: {
        '/home': (context) => Intro(),
        // Add more named routes as needed
      },
      debugShowCheckedModeBanner: false, home: Start()
      ));
}

