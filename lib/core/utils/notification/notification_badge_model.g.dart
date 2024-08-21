// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_badge_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationBadgeModelAdapter
    extends TypeAdapter<NotificationBadgeModel> {
  @override
  final int typeId = 0;

  @override
  NotificationBadgeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationBadgeModel(
      userId: fields[0] as String,
      badgeCount: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationBadgeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.badgeCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationBadgeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
