
import 'package:hive_flutter/hive_flutter.dart';
part 'task.g.dart';
@HiveType(typeId: 2)
class Task extends HiveObject{
  @HiveField(0)
  String author;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;
  @HiveField(3)
  int likes;
  @HiveField(4)
  int shares;
  @HiveField(5)
  int id;
  Task({
    required this.content,
    required this.shares,
    required this.date,
    required this.author,
    required this.likes,
    required this.id,
  });
}