import 'package:hive_flutter/hive_flutter.dart';
import '../entity/account.dart';
import '../entity/comment.dart';
import '../entity/task.dart';

class BoxManager{
  static final BoxManager instance = BoxManager._();
  BoxManager._();
  Future<Box<Account>> openAccountBox() async{
    return _openBox("account_box", 0, AccountAdapter());
  }
  Future<Box<Task>> openPostsBox() async{
    return _openBox("task_box", 2, TaskAdapter());
  }
  Future<Box<Comment>> openCommentsBox() async{
    return _openBox("comment_box", 3, CommentAdapter());
  }

  Future<Box<T>> _openBox<T>(String name, int typeId,TypeAdapter<T> adapter) async{
    if(!Hive.isAdapterRegistered(typeId)){
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }

  Future <void> closeBox<T>(Box<T> box) async {
    await box.compact();
    await box.close();
  }
}