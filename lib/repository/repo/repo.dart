import 'dart:convert';
import 'package:car_m/repository/models/login/login.dart';
import 'package:car_m/repository/models/profile/followers.dart';
import 'package:car_m/repository/models/profile/followersPage/follower_followings_list.dart';
import 'package:car_m/repository/models/profile/post/post.dart';
import 'package:car_m/repository/models/profile/profile.dart';
import 'package:car_m/repository/models/register/register.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import '../../secure_storage/shared_preferences.dart';
import '../models/login/token.dart';
import '../models/profile/user.dart';

class RecarRepository {
  final String api = 'http://89.223.100.35:8080/api/v1';
  Future<bool> login(LoginModel json) async {
    Response? response;
    try {
      response = await Dio().post('$api/auth/login',
          data: {"username": json.username, "password": json.password});
      if (response.statusCode == 200) {
        final token = TokenModel.fromJson(response.data);
        await SharedPrefModel().saveToken(token.token);
        await SharedPrefModel().setProfileId(token.username);
        return true;
      } else {
        return false;
      }
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<void> register(RegisterModel model) async {
    var formData = {
      "email": model.email,
      "login": model.login,
      "password": model.password,
      "fullName": model.fullName,
    };
    try {
      await Dio().post('$api/auth/register', data: jsonEncode(formData));
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<ProfileModel> getProfile() async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().get('$api/profile/',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      final model = ProfileModel.fromJson(response.data);
      return model;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<ProfileModel> getSingleProfile(String id) async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().get('$api/profile/$id',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      final model = ProfileModel.fromJson(response.data);
      return model;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<UserModel>> getUsers() async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().get('$api/user/',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return (response.data as List).map((x) => UserModel.fromJson(x)).toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<FollowersFollowings>> getFollowers(String id) async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().get('$api/user/followers/$id',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return (response.data as List)
          .map((x) => FollowersFollowings.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<FollowersModel>> getProfileFollowers(String id) async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().get('$api/user/followers/$id',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return (response.data as List)
          .map((x) => FollowersModel.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<FollowersFollowings>> getFollowings(String id) async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().get('$api/profile/$id',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      final model = ProfileModel.fromJson(response.data);
      return model.following;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<void> follow(int id) async {
    final token = await SharedPrefModel().getToken();
    var formData = FormData.fromMap({
      "userId": id,
    });
    try {
      await Dio().post('$api/user/follow/',
          data: formData,
          options: Options(headers: {"Authorization": "Bearer $token"}));
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<void> createPost(File? file,String description) async {
    if(file != null) {
      String fileName = file.path
          .split('/')
          .last;
      final token = await SharedPrefModel().getToken();
      var formData = FormData.fromMap({
        "position": 2,
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
        "description": description
      });
      try {
        await Dio().post('$api/post/add',
            data: formData,
            options: Options(headers: {"Authorization": "Bearer $token"}));
      } catch (error, stacktrace) {
        throw Exception("Exception occured: $error stackTrace: $stacktrace");
      }
    }
  }
  Future<List<PostModel>> getPost(String id) async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().get('$api/profile/$id',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      final model = ProfileModel.fromJson(response.data);
      return model.posts;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
  Future<List<PostModel>> getSaves(String id) async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().get('$api/profile/$id',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      final model = ProfileModel.fromJson(response.data);
      return model.saves;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
  Future<void> postSave(String id) async {
    Response? response;
    final token = await SharedPrefModel().getToken();
    try {
      response = await Dio().post('$api/post/save/$id',
          options: Options(headers: {"Authorization": "Bearer $token"}));
    print(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<void> uploadAvatar(File? file,) async {
    if(file != null) {
      String fileName = file.path
          .split('/')
          .last;
      final token = await SharedPrefModel().getToken();
      var formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      try {
        await Dio().post('$api/user/upload/avatar',
            data: formData,
            options: Options(headers: {"Authorization": "Bearer $token"}));
      } catch (error, stacktrace) {
        throw Exception("Exception occured: $error stackTrace: $stacktrace");
      }
    }
  }
  Future<void> uploadBackground(File? file,) async {
    if(file != null) {
      String fileName = file.path
          .split('/')
          .last;
      final token = await SharedPrefModel().getToken();
      var formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      try {
        await Dio().post('$api/user/upload/background',
            data: formData,
            options: Options(headers: {"Authorization": "Bearer $token"}));
      } catch (error, stacktrace) {
        throw Exception("Exception occured: $error stackTrace: $stacktrace");
      }
    }
  }
}
