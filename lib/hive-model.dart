import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'info.dart';

class HiveBoxes {
  static Future<void> initHive() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(InfoAdapter()); // Register the adapter for your model

    await Hive.openBox<Info>('infos'); // Open the box for your model
  }

  static Box<Info> get infosBox => Hive.box<Info>('infos'); // Access the box for your model
}
