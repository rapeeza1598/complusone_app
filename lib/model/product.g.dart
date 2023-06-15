// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 82;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[1] as String,
      sort: fields[2] as int,
      categoryId: fields[3] as String,
      categoryName: fields[4] as String,
      categoryNameTh: fields[5] as String,
      imageLogo: fields[6] as String,
      name: fields[7] as String,
      content: fields[8] as String,
      link: fields[9] as String,
      nameTh: fields[10] as String,
      contentTh: fields[11] as String,
      isActive: fields[12] as bool,
      isDelete: fields[13] as bool,
      createDate: fields[14] as DateTime?,
      createBy: fields[15] as String?,
      updateDate: fields[16] as DateTime?,
      updateBy: fields[17] as String?,
      deleteDate: fields[18] as DateTime?,
      deleteBy: fields[19] as String?,
      productImage: (fields[20] as List).cast<String>(),
      productTag: (fields[21] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(21)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.sort)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.categoryName)
      ..writeByte(5)
      ..write(obj.categoryNameTh)
      ..writeByte(6)
      ..write(obj.imageLogo)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.content)
      ..writeByte(9)
      ..write(obj.link)
      ..writeByte(10)
      ..write(obj.nameTh)
      ..writeByte(11)
      ..write(obj.contentTh)
      ..writeByte(12)
      ..write(obj.isActive)
      ..writeByte(13)
      ..write(obj.isDelete)
      ..writeByte(14)
      ..write(obj.createDate)
      ..writeByte(15)
      ..write(obj.createBy)
      ..writeByte(16)
      ..write(obj.updateDate)
      ..writeByte(17)
      ..write(obj.updateBy)
      ..writeByte(18)
      ..write(obj.deleteDate)
      ..writeByte(19)
      ..write(obj.deleteBy)
      ..writeByte(20)
      ..write(obj.productImage)
      ..writeByte(21)
      ..write(obj.productTag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
