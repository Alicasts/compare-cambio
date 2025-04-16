// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_comparison.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AvailableComparisonAdapter extends TypeAdapter<AvailableComparison> {
  @override
  final int typeId = 1;

  @override
  AvailableComparison read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvailableComparison(
      pairCode: fields[0] as String,
      label: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AvailableComparison obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pairCode)
      ..writeByte(1)
      ..write(obj.label);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailableComparisonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
