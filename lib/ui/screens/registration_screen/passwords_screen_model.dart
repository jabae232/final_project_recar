import 'package:car_m/domain/entity/account.dart';
import 'package:car_m/repository/models/register/register.dart';
import 'package:car_m/repository/repo/repo.dart';
import 'package:flutter/material.dart';
import '../../../domain/data_provider/box_manager.dart';
import '../../navigation/main_navigation.dart';

class PasswordScreenModel extends ChangeNotifier {
  bool _visibilityFirst = false;
  bool _visibilitySecond = false;
  set visibility(bool value) {
    _visibilityFirst = value;
    notifyListeners();
  }

  set visibilitySecond(bool value) {
    _visibilitySecond = value;
    notifyListeners();
  }

  var _accountPassword = '';
  set password(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _accountPassword = value;
  }

  String? errorText;
  void createAccount(BuildContext context) async {
    final box = await BoxManager.instance.openAccountBox();
    final model = RegisterModel(
        login: box.getAt(box.length - 1)!.nickname,
        password: _accountPassword,
        email: box.getAt(box.length - 1)!.number,
        fullName:
            "${box.getAt(box.length - 1)!.name} ${box.getAt(box.length - 1)!.surname}");
    await RecarRepository().register(model);
    box.deleteFromDisk();
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.loginPage);
  }
}

class PasswordScreenModelProvider extends InheritedNotifier {
  PasswordScreenModel model;
  PasswordScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static PasswordScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PasswordScreenModelProvider>();
  }

  static PasswordScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<PasswordScreenModelProvider>()
        ?.widget;
    return widget is PasswordScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(PasswordScreenModelProvider oldWidget) {
    return false;
  }
}
