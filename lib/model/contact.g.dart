// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 82;

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      id: fields[1] as String?,
      sort: fields[2] as int?,
      name: fields[3] as String,
      link: fields[4] as String,
      imageLogo: fields[5] as String,
      isActive: fields[6] as bool?,
      isDelete: fields[7] as bool?,
      createDate: fields[8] as DateTime?,
      createBy: fields[9] as String?,
      updateDate: fields[10] as DateTime?,
      updateBy: fields[11] as String?,
      deleteDate: fields[12] as DateTime?,
      deleteBy: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.sort)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.link)
      ..writeByte(5)
      ..write(obj.imageLogo)
      ..writeByte(6)
      ..write(obj.isActive)
      ..writeByte(7)
      ..write(obj.isDelete)
      ..writeByte(8)
      ..write(obj.createDate)
      ..writeByte(9)
      ..write(obj.createBy)
      ..writeByte(10)
      ..write(obj.updateDate)
      ..writeByte(11)
      ..write(obj.updateBy)
      ..writeByte(12)
      ..write(obj.deleteDate)
      ..writeByte(13)
      ..write(obj.deleteBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
