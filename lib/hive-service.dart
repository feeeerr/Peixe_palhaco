import 'package:hive/hive.dart';
import 'hive-model.dart';
import 'info.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static HiveService? _instance;
  Box<Info>? _infoBox;

  HiveService._();

  static Future<HiveService> getInstance() async {
    if (_instance == null) {
      _instance = HiveService._();
      await _instance!.initialize();
    }
    return _instance!;
  }

  Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(InfoAdapter());
    _infoBox = await Hive.openBox<Info>('infos');
  }

  Box<Info>? get infoBox => _infoBox; // Getter method for infoBox
}