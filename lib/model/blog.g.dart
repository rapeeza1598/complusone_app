// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogAdapter extends TypeAdapter<Blog> {
  @override
  final int typeId = 22;

  @override
  Blog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Blog(
      id: fields[1] as String,
      sort: fields[2] as int,
      imageTitle: fields[3] as String,
      title: fields[4] as String,
      content: fields[5] as String,
      isActive: fields[6] as bool,
      isDelete: fields[7] as bool,
      createDate: fields[8] as DateTime,
      createBy: fields[9] as String,
      updateDate: fields[10] as DateTime?,
      updateBy: fields[11] as String?,
      deleteDate: fields[12] as DateTime?,
      deleteBy: fields[13] as String?,
      titleTh: fields[14] as String?,
      contentTh: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Blog obj) {
    writer
      ..writeByte(15)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.sort)
      ..writeByte(3)
      ..write(obj.imageTitle)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.content)
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
      ..write(obj.deleteBy)
      ..writeByte(14)
      ..write(obj.titleTh)
      ..writeByte(15)
      ..write(obj.contentTh);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
