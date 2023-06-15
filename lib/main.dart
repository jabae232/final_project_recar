import 'package:car_m/secure_storage/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'domain/data_provider/dependencies_provider.dart';
import 'l10n/l10n.dart';
import 'ui/navigation/main_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final reposetory = SharedPrefModel();
  await reposetory.init();
  var defaultLocale = const Locale('ru','RU');
  final locale = await reposetory.readLocale();
  if(locale == 'en') {
    defaultLocale = const Locale('en', 'EN');
  }if(locale == 'ru') {
    defaultLocale = const Locale('ru', 'RU');
  }
  runApp(DependenciesProvider(builder: (BuildContext context) {
    return MyApp(locale: defaultLocale,);
  }));
}
class MyApp extends StatefulWidget {
  Locale? locale;
  static final mainNavigation = MainNavigation();
  MyApp({Key? key,required this.locale}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  void setLocale(Locale value) {
    setState(() {
      widget.locale = value;
      SharedPrefModel().saveLocale(widget.locale!);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: widget.locale,
      supportedLocales: L10n.all,
      debugShowCheckedModeBanner: false,
      initialRoute: MyApp.mainNavigation.initialRoute,
      routes: MyApp.mainNavigation.routes,
    );
  }
}
