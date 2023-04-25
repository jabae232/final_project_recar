import 'dart:async';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefModel {
  final _storage = SharedPreferences.getInstance();
  Future<String> loggedRead() async{
    final storage = await _storage;
    final value = storage.getString('logged');
    return value ?? 'N';
  }
  Future<void> loggedWrite(String value) async{
    final storage = await _storage;
    await storage.setString('logged', value);
  }
  Future<void> tokenReset() async{
    final storage = await _storage;
    await storage.setString('token', '');
  }
  SharedPreferences? prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> saveLocale(Locale locale) async {
    prefs = await SharedPreferences.getInstance();
    return prefs?.setString('locale', locale.toString());
  }

  Future<String?> readLocale() async {
    return prefs?.getString('locale');
  }

  Future<void> saveToken(String token) async{
    prefs = await SharedPreferences.getInstance();
    if(prefs?.getString('token')?.isEmpty ?? true) {
      await prefs?.setString('token', token);
      print('token is set');
      print(prefs?.getString('token'));
    } else {
      await prefs?.remove('token');
      await prefs?.setString('token', token);
    }
  }
  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs?.getString('token') ?? '';
  }
}
