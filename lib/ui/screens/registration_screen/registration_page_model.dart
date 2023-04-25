import 'package:car_m/domain/entity/account.dart';
import 'package:flutter/material.dart';
import '../../../domain/data_provider/box_manager.dart';
import '../../navigation/main_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationFormModel extends ChangeNotifier {
  var checkbox = false;
  var _accountNumber = '';
  set number(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _accountNumber = value;
  }

  String? errorText;
  void createAccount(BuildContext context) async {
    if (_accountNumber.trim().isEmpty) {
      errorText = AppLocalizations.of(context)!.enterYourPhoneNumber;
      notifyListeners();
      return;
    }
    final box = await BoxManager.instance.openAccountBox();
    final account = Account(
      name: '',
      surname: '',
      dateOfBirth: '',
      number: _accountNumber.trim(),
      gender: '',
      password: '',
      nickname: '',
      followers: 0,
      followings: 0,
      clubs: 0,
    );
    await box.add(account);
    await BoxManager.instance.closeBox(box);
    Navigator.push(context, MainNavigationPush().confirmation);
  }
}

class RegistrationFormModelProvider extends InheritedNotifier {
  RegistrationFormModel model;
  RegistrationFormModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static RegistrationFormModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RegistrationFormModelProvider>();
  }

  static RegistrationFormModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            RegistrationFormModelProvider>()
        ?.widget;
    return widget is RegistrationFormModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(RegistrationFormModelProvider oldWidget) {
    return false;
  }
}
