// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_banner.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdBannerAdapter extends TypeAdapter<AdBanner> {
  @override
  final int typeId = 100;

  @override
  AdBanner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdBanner(
      id: fields[1] as String,
      sort: fields[2] as int,
      imageName: fields[3] as String,
      isActive: fields[4] as bool,
      isDelete: fields[5] as bool,
      createDate: fields[6] as DateTime?,
      createBy: fields[7] as String?,
      updateDate: fields[8] as DateTime?,
      updateBy: fields[9] as String?,
      deleteDate: fields[10] as DateTime?,
      deleteBy: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AdBanner obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.sort)
      ..writeByte(3)
      ..write(obj.imageName)
      ..writeByte(4)
      ..write(obj.isActive)
      ..writeByte(5)
      ..write(obj.isDelete)
      ..writeByte(6)
      ..write(obj.createDate)
      ..writeByte(7)
      ..write(obj.createBy)
      ..writeByte(8)
      ..write(obj.updateDate)
      ..writeByte(9)
      ..write(obj.updateBy)
      ..writeByte(10)
      ..write(obj.deleteDate)
      ..writeByte(11)
      ..write(obj.deleteBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdBannerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
