// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 0;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      name: fields[0] as String,
      surname: fields[1] as String,
      dateOfBirth: fields[2] as String,
      number: fields[3] as String,
      gender: fields[5] as String,
      password: fields[4] as String,
      nickname: fields[6] as String,
      clubs: fields[9] as int?,
      followings: fields[8] as int?,
      followers: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.surname)
      ..writeByte(2)
      ..write(obj.dateOfBirth)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.nickname)
      ..writeByte(7)
      ..write(obj.followers)
      ..writeByte(8)
      ..write(obj.followings)
      ..writeByte(9)
      ..write(obj.clubs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
