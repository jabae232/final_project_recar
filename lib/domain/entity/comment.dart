import 'package:hive_flutter/hive_flutter.dart';
part 'comment.g.dart';
@HiveType(typeId: 3)
class Comment extends HiveObject{
  @HiveField(0)
  String author;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;
  @HiveField(3)
  int likes;
  @HiveField(4)
  int replies;
  @HiveField(5)
  int postId;
  @HiveField(6)
  int comId;
  Comment({
    required this.author,
    required this.content,
    required this.date,
    required this.likes,
    required this.replies,
    required this.postId,
    required this.comId
  });
}