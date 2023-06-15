// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 5;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      email: fields[4] as String,
      imageName: fields[5] as String,
      phoneNumber: fields[6] as String,
      companyName: fields[7] as String,
      roleId: fields[8] as String,
      roleName: fields[9] as String,
      isActive: fields[10] as bool,
      isDelete: fields[11] as bool,
      createDate: fields[12] as DateTime,
      createBy: fields[13] as String,
      updateDate: fields[14] as DateTime,
      updateBy: fields[15] as String,
      deleteDate: fields[16] as DateTime?,
      deleteBy: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(17)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.imageName)
      ..writeByte(6)
      ..write(obj.phoneNumber)
      ..writeByte(7)
      ..write(obj.companyName)
      ..writeByte(8)
      ..write(obj.roleId)
      ..writeByte(9)
      ..write(obj.roleName)
      ..writeByte(10)
      ..write(obj.isActive)
      ..writeByte(11)
      ..write(obj.isDelete)
      ..writeByte(12)
      ..write(obj.createDate)
      ..writeByte(13)
      ..write(obj.createBy)
      ..writeByte(14)
      ..write(obj.updateDate)
      ..writeByte(15)
      ..write(obj.updateBy)
      ..writeByte(16)
      ..write(obj.deleteDate)
      ..writeByte(17)
      ..write(obj.deleteBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
