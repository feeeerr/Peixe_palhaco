// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfoAdapter extends TypeAdapter<Info> {
  @override
  final int typeId = 0;

  @override
  Info read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Info()
      ..isLogged = fields[0] as bool
      ..email = fields[1] as String
      ..name = fields[2] as String
      ..password = fields[3] as String
      ..firstTime = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, Info obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.isLogged)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.firstTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
