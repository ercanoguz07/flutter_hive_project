// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userlogmodal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLogModelAdapter extends TypeAdapter<UserLogModel> {
  @override
  final int typeId = 1;

  @override
  UserLogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLogModel(
      userId: fields[0] as int?,
      fullname: fields[1] as String?,
      phone: fields[2] as String?,
      amount: fields[3] as String?,
      country: fields[4] as String?,
      islem: fields[5] as String?,
      islemDate: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLogModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.fullname)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.islem)
      ..writeByte(6)
      ..write(obj.islemDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
