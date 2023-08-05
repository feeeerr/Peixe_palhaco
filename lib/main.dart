import 'package:flutter/material.dart';
import 'package:front_end/tela1.dart';
import 'package:front_end/theme/dark_theme.dart';
import 'package:front_end/theme/light_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'info.dart';
import 'hive-model.dart';
import 'intro.dart';
import 'hive-service.dart';

Future<Info> createInitialUser() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveService = await HiveService.getInstance();

  final infoBox = hiveService?.infoBox;
  if (infoBox != null) {
    final info = Info();
    info.email = '';
    info.name = '';
    info.password = '';
    info.cord_x = null;
    info.cord_y = null;
    info.isLogged = false;
    info.firstTime = true;
    infoBox.add(info); // Add an item to the infoBox

    return info;
  }
  // Return a default Info object if infoBox is not available
  return Info();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveService = await HiveService.getInstance();

  final infoBox = hiveService?.infoBox;
  if (infoBox == null || infoBox.isEmpty) {
    await createInitialUser();
  }
  final info = infoBox?.getAt(0) as Info?;
  
  if (info != null ) {
    if (!info.isLogged){runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));
}
    else {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Intro(),
    ));
  }
  } 
}





// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Hive Example'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               final infoBox = HiveBoxes.infosBox;
//               final info = Info()
//                 ..name = 'John Doe'
//                 ..age = 30;
//               infoBox.add(info); // Add a person to the box

//               final savedInfo = infoBox.getAt(0); // Retrieve a person from the box
//               print(savedInfo?.name); // Output: John Doe
//             },
//             child: Text('Add Person'),
//           ),
//         ),
//       ),
//     );
//   }
// }

