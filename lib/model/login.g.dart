// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemperaturesAdapter extends TypeAdapter<Temperatures> {
  @override
  final int typeId = 0;

  @override
  Temperatures read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Temperatures(
      status: fields[1] as int,
      success: fields[2] as bool,
      data: fields[3] as Data,
    );
  }

  @override
  void write(BinaryWriter writer, Temperatures obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.success)
      ..writeByte(3)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemperaturesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      success: fields[1] as bool,
      message: fields[2] as dynamic,
      refreshToken: fields[3] as String,
      token: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.refreshToken)
      ..writeByte(4)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
