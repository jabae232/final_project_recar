import 'package:car_m/repository/repo/repo.dart';
import 'package:flutter/material.dart';
import '../../../repository/models/login/login.dart';
import '../../../secure_storage/shared_preferences.dart';
import '../../navigation/main_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginScreenModel extends ChangeNotifier {
  var _login = '';
  var _password = '';
  var _visibility = false;
  set visibility(bool value) {
    _visibility = value;
    notifyListeners();
  }

  final model = SharedPrefModel();
  set login(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _login = value;
  }

  set password(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _password = value;
  }

  String? errorText;
  String? errorPass;
  void signIn(BuildContext context) async {
    /*final a = await BoxManager.instance.openProfileBox();
    a.deleteFromDisk();*/
    if (_login.trim().length <= 4 && _password.trim().length <= 4) {
      errorText = "${AppLocalizations.of(context)?.loginMustHaveMoreThan}";
      errorPass = "${AppLocalizations.of(context)?.passMustHaveMoreThan}";
      notifyListeners();
      return;
    }
    if (_login.trim().length <= 4) {
      errorText = "${AppLocalizations.of(context)?.loginMustHaveMoreThan}";
      notifyListeners();
      return;
    }
    if (_password.trim().length <= 4) {
      errorPass = "${AppLocalizations.of(context)?.loginMustHaveMoreThan}";
      notifyListeners();
      return;
    }
    final login = LoginModel(username: _login.trim(),password: _password.trim());
    print(login.toJson());
    if(await RecarRepository().login(login)) {
      final modelSharedPref = SharedPrefModel();
      modelSharedPref.loggedWrite('Y');
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.mainRoute);
    } else {
      Navigator.pop(context);
    }
  }
}

class LoginScreenModelProvider extends InheritedNotifier {
  LoginScreenModel model;
  LoginScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static LoginScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginScreenModelProvider>();
  }

  static LoginScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LoginScreenModelProvider>()
        ?.widget;
    return widget is LoginScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(LoginScreenModelProvider oldWidget) {
    return false;
  }
}
