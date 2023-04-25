import 'package:car_m/domain/data_provider/box_manager.dart';
import 'package:flutter/material.dart';
import '../../../secure_storage/shared_preferences.dart';
import '../../navigation/main_navigation.dart';
class ServicesPageModel extends ChangeNotifier{
  String? _lang = '';

  set lang(String value){
    _lang = value;
    notifyListeners();
  }
   String getLang(){
    return _lang!;
  }
  Future<void> leave(context) async {
    final model = SharedPrefModel();
    if(await model.loggedRead() == 'Y') {
      model.loggedWrite('N');
      model.tokenReset();
      Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.loginPage);
    }
  }
}

class  ServicesPageModelProvider extends InheritedNotifier {

  ServicesPageModel model;
  ServicesPageModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key,notifier: model, child: child);
  static ServicesPageModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ServicesPageModelProvider>();
  }

  static ServicesPageModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ServicesPageModelProvider>()
        ?.widget;
    return widget is ServicesPageModelProvider ? widget : null;
  }
}
