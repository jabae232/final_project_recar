import 'package:car_m/secure_storage/shared_preferences.dart';
class ProfileRouter {
  Future<bool> checkProfile(String id) async{
    final ownProfileId = await SharedPrefModel().getProfileId();
    if(id == ownProfileId) {
      return true;
    } else {
      return false;
    }
  }
}