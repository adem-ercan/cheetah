// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatMessageHiveModelAdapter extends TypeAdapter<ChatMessageHiveModel> {
  @override
  final int typeId = 0;

  @override
  ChatMessageHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatMessageHiveModel(
      contant: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChatMessageHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.contant);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessageHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
