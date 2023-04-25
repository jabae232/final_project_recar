// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final int typeId = 3;

  @override
  Comment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comment(
      author: fields[0] as String,
      content: fields[1] as String,
      date: fields[2] as String,
      likes: fields[3] as int,
      replies: fields[4] as int,
      postId: fields[5] as int,
      comId: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.likes)
      ..writeByte(4)
      ..write(obj.replies)
      ..writeByte(5)
      ..write(obj.postId)
      ..writeByte(6)
      ..write(obj.comId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
