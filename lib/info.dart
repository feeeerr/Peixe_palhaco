import 'package:hive/hive.dart';

part 'info.g.dart'; // Generated file

@HiveType(typeId: 0)
class Info extends HiveObject {
  @HiveField(0)
  late bool isLogged;

  @HiveField(1)
  late String email;
  
  @HiveField(2)
  late String name;
  
  @HiveField(3)
  late String password;  
  
  @HiveField(4)
  late bool firstTime;

  @HiveField(5)
  late double? cord_x;
  
  @HiveField(6)
  late double? cord_y;
}