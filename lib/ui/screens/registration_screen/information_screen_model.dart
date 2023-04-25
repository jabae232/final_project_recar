import 'package:car_m/domain/entity/account.dart';
import 'package:flutter/material.dart';
import '../../../domain/data_provider/box_manager.dart';
import '../../navigation/main_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class InformationScreenModel extends ChangeNotifier {
  var _accountFirstName = '';
  var _accountSecondName = '';
  var _accountDateOfBirth = '';
  var _accountGender = '';
  var _accountNickname = '';
  String? errorName;
  String? errorSecondName;
  String? errorLogin;
  String? errorDate;
  String? errorGender;
  set firstName(String value) {
    if (errorName != null && value.trim().isNotEmpty) {
      errorName = null;
      notifyListeners();
    }
    _accountFirstName = value;
  }

  set secondName(String value) {
    if (errorSecondName != null && value.trim().isNotEmpty) {
      errorSecondName = null;
      notifyListeners();
    }
    _accountSecondName = value;
  }

  set dateOfBirth(String value) {
    if (errorDate != null && value.trim().isNotEmpty) {
      errorDate = null;
      notifyListeners();
    }
    _accountDateOfBirth = value;
  }

  set gender(String value) {
    if (errorGender != null && value.trim().isNotEmpty) {
      errorGender = null;
      notifyListeners();
    }
    _accountGender = value;
  }

  set nickname(String value) {
    if (errorLogin != null && value.trim().isNotEmpty) {
      errorLogin = null;
      notifyListeners();
    }
    _accountNickname = value;
  }


  void createAccount(BuildContext context) async {
    final box = await BoxManager.instance.openAccountBox();
    final account = Account(
      name: _accountFirstName,
      surname: _accountSecondName,
      dateOfBirth: _accountDateOfBirth,
      number: box.getAt(box.length - 1)?.number ?? '',
      gender: _accountGender,
      password: '',
      nickname: _accountNickname.toLowerCase(),
      followers: 0,
      followings: 0,
      clubs: 0,
    );
    print('${account.clubs} ${account.followers},${account.followings},${account.surname},${account.number},');
    await box.putAt(box.length-1,account);
    await BoxManager.instance.closeBox(box);
  }
  void signUp(context){
    bool isAnythingEmpty = false;
    if(_accountFirstName.trim().isEmpty){
      errorName =AppLocalizations.of(context)!.enterYourName;
      isAnythingEmpty = true;
    }
    if(_accountSecondName.trim().isEmpty){
      errorSecondName =AppLocalizations.of(context)!.enterYourSurname;
      isAnythingEmpty = true;
    }
    if(_accountNickname.trim().isEmpty){
      errorLogin =AppLocalizations.of(context)!.enterYourLogin;
      isAnythingEmpty = true;
    }
    if(_accountDateOfBirth.trim().isEmpty){
      errorDate =AppLocalizations.of(context)!.enterYourDateOfBirth;
      isAnythingEmpty = true;
    }
    if(isAnythingEmpty == false) {
      createAccount(context);
      Navigator.push(context, MainNavigationPush().security);
    } else {
      notifyListeners();
      return;
    }
  }
}

class InformationScreenModelProvider extends InheritedNotifier {
  final InformationScreenModel model;
  const InformationScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static InformationScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InformationScreenModelProvider>();
  }

  static InformationScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            InformationScreenModelProvider>()
        ?.widget;
    return widget is InformationScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(InformationScreenModelProvider oldWidget) {
    return false;
  }
}
