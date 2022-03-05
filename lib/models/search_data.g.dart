// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchDataAdapter extends TypeAdapter<SearchData> {
  @override
  final int typeId = 2;

  @override
  SearchData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchData(
      calcHistory: fields[0] as String,
      calcResult: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.calcHistory)
      ..writeByte(1)
      ..write(obj.calcResult);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
