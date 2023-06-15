// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategorysAdapter extends TypeAdapter<Categorys> {
  @override
  final int typeId = 92;

  @override
  Categorys read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categorys(
      id: fields[1] as String,
      sort: fields[2] as int?,
      name: fields[3] as String,
      imageName: fields[4] as String,
      nameTh: fields[5] as String?,
      content: fields[6] as String,
      contentTh: fields[7] as String?,
      isActive: fields[8] as bool?,
      isDelete: fields[9] as bool?,
      createDate: fields[10] as DateTime?,
      createBy: fields[11] as String?,
      updateDate: fields[12] as DateTime?,
      updateBy: fields[13] as String?,
      deleteDate: fields[14] as DateTime?,
      deleteBy: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Categorys obj) {
    writer
      ..writeByte(15)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.sort)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.imageName)
      ..writeByte(5)
      ..write(obj.nameTh)
      ..writeByte(6)
      ..write(obj.content)
      ..writeByte(7)
      ..write(obj.contentTh)
      ..writeByte(8)
      ..write(obj.isActive)
      ..writeByte(9)
      ..write(obj.isDelete)
      ..writeByte(10)
      ..write(obj.createDate)
      ..writeByte(11)
      ..write(obj.createBy)
      ..writeByte(12)
      ..write(obj.updateDate)
      ..writeByte(13)
      ..write(obj.updateBy)
      ..writeByte(14)
      ..write(obj.deleteDate)
      ..writeByte(15)
      ..write(obj.deleteBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
