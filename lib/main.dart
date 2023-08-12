import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// screens
import 'screens/user/intro.dart';
import 'screens/user/start.dart';

bool _isLogged = false;

// Function to load the stored value from SharedPreferences
Future<void> _isLoggedStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _isLogged = prefs.getBool('is_logged') ?? false;
}

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter is initialized first.

  // Load the notification status before running the app
  await _isLoggedStatus();

  runApp(_isLogged
      ? MaterialApp(
          theme: ThemeData(
            fontFamily: 'Telegraf',
          ),
          debugShowCheckedModeBanner: false,
          home: Intro())
      : MaterialApp(
          theme: ThemeData(
            fontFamily: 'Telegraf',
          ),
          routes: {
            '/home': (context) => Intro(),
            // Add more named routes as needed
          },
          debugShowCheckedModeBanner: false,
          home: Start()));
}
