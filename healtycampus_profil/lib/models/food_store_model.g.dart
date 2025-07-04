// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_store_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodStoreModelAdapter extends TypeAdapter<FoodStoreModel> {
  @override
  final int typeId = 1;

  @override
  FoodStoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodStoreModel(
      name: fields[0] as String,
      address: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FoodStoreModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodStoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
