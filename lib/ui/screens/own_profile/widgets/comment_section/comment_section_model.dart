import 'package:car_m/domain/entity/comment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../domain/data_provider/box_manager.dart';

class CommentSectionWidgetModel extends ChangeNotifier {
  var _content = '';
  List<Comment>? comments = [];
  List<Comment> exactComments = [];
  late var length = exactComments.length;
  ValueListenable<Object>? _listenable;
  late final _postId;
  void postId(int id) {
    _postId = id;
  }
  set content(String value) {
    _content = value;
  }
  late final Future<Box<Comment>> commentBox;
  void setup() async {
    commentBox = BoxManager.instance.openCommentsBox();
    await _readCommentsFromHive();
    _listenable = (await commentBox).listenable();
    _listenable?.addListener(_readCommentsFromHive);
  }
  Future<void> _readCommentsFromHive() async {
    comments = (await commentBox)
        .values
        .map((e) => Comment(
            author: e.author,
            content: e.content,
            date: e.date,
            likes: e.likes,
            replies: e.replies,
            postId: e.postId,
    comId: e.comId)).toList() as List<Comment>;
    for(int i = comments!.length - 1; i >= 0; i--) {
      if(comments![i].postId == _postId) {
        exactComments.add(comments![i]);
      }
    }
    notifyListeners();
  }
  void writeComment(context) async{
    final commentBox = await BoxManager.instance.openCommentsBox();
    final String date = DateTime.now().toString();
    const likes = 0;
    const replies = 0;
    final id = ((commentBox).getAt((commentBox).values.length - 1)?.comId ?? 0) + 1;
    final postId = _postId;
    final content = _content;
    final comment = Comment(author: '23', content: content, date: date, likes: likes, replies: replies, postId: postId, comId: id);
    await (commentBox).add(comment);
    Navigator.pop(context);
    notifyListeners();
  }
}

class CommentSectionWidgetProvider extends InheritedNotifier {
  CommentSectionWidgetModel model;
  CommentSectionWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);
  static CommentSectionWidgetProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CommentSectionWidgetProvider>();
  }

  static CommentSectionWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<CommentSectionWidgetProvider>()
        ?.widget;
    return widget is CommentSectionWidgetProvider ? widget : null;
  }
}
