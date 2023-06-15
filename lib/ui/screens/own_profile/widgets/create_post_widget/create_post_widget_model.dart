import 'package:car_m/ui/screens/own_profile/widgets/posts/data/bloc/own_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../repository/repo/repo.dart';
import 'dart:io';

class CreatePostWidgetModel extends ChangeNotifier {
  var _content = "";
  final _apiClient = RecarRepository();
  String? errorText;
  set content(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _content = value;
  }
  File? _image;
  get image => _image;
  Future getImage(context) async {
    final picker = ImagePicker();
    var _pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500,  // <- reduce the image size
        maxWidth: 500);
    _image = File(_pickedFile!.path);
    notifyListeners();
  }

  void uploadPost(context) async {
    final followersResponse = await _apiClient.createPost(_image, _content);
    BlocProvider.of<OwnPostBloc>(context).add(GetPostsEvent());
    Navigator.pop(context);
  }
}
