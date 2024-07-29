// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductSummaryAdapter extends TypeAdapter<ProductSummary> {
  @override
  final int typeId = 1;

  @override
  ProductSummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductSummary(
      id: fields[0] as String,
      title: fields[1] as String,
      price: fields[2] as double,
      images: (fields[3] as List).cast<String>(),
    )..quantity = fields[4] as int;
  }

  @override
  void write(BinaryWriter writer, ProductSummary obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
