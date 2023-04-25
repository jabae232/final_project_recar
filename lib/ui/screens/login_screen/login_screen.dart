import 'package:car_m/repository/repo/repo.dart';
import 'package:car_m/secure_storage/shared_preferences.dart';
import 'package:car_m/ui/navigation/main_navigation.dart';
import 'package:car_m/ui/screens/login_screen/login_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../main.dart';
import '../bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final model = LoginScreenModel();
  @override
  Widget build(BuildContext context) {
    return LoginScreenModelProvider(model: model, child: _LoginScreenBody());
  }
}
class _LoginScreenBody extends StatelessWidget {
   _LoginScreenBody({Key? key}) : super(key: key);
  bool check = true;
  final modelSharedPref = SharedPrefModel();
  void logIn() {
    final modelSharedPref = SharedPrefModel();
    modelSharedPref.loggedWrite('Y');
  }


  @override
  Widget build(BuildContext context) {
    void createAccount() {
      Navigator.push(context, MainNavigationPush().registration);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: modelSharedPref.loggedRead(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data.toString() == "Y") {
              return const BottomNavBar();
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: SvgPicture.asset(AppAssets.svg.logo),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(Icons.language_outlined,color: Colors.blue,),
                          const SizedBox(width: 20,),
                          DropdownButton<String>(
                              value: Intl.getCurrentLocale(),
                              items: [
                                DropdownMenuItem(
                                  value: 'en_US',
                                  child: Text(
                                    AppLocalizations.of(context)!.english,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'ru_RU',
                                  child: Text(AppLocalizations.of(context)!.russian),
                                )
                              ],
                              onChanged:(value) async{
                                if(value == null) return;
                                if(value == 'ru_RU') {
                                  MyApp.of(context)?.setLocale(const Locale.fromSubtags(languageCode: 'ru'));
                                } else if(value == 'en_US') {
                                  MyApp.of(context)?.setLocale(const Locale.fromSubtags(languageCode: 'en'));
                                }
                              }
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                      ),
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                         Text(
                            "${AppLocalizations.of(context)?.login}"
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              onChanged: (value) => LoginScreenModelProvider.watch(context)?.model.login = value,
                              decoration: InputDecoration(
                                  prefixIcon:  const Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 16),
                                    child: Icon(Icons.account_box),
                                  ),
                                  hintText: "${AppLocalizations.of(context)?.username}",
                                  errorText: LoginScreenModelProvider.watch(context)?.model.errorText,
                                  fillColor: AppColors.regWhite,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(14.0)),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                "${AppLocalizations.of(context)?.password}"
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              onChanged: (value) => LoginScreenModelProvider.watch(context)?.model.password = value,
                                obscureText: check,
                                obscuringCharacter: '・',
                                decoration: InputDecoration(
                                    prefixIcon: const Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 16),
                                      child: Icon(Icons.lock),
                                    ),
                                    errorText: LoginScreenModelProvider.watch(context)?.model.errorPass,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                          if (check == true) {
                                            check = false;
                                          } else {
                                            check = true;
                                          }
                                          LoginScreenModelProvider.watch(context)?.model.visibility = check;
                                      },
                                      icon: check ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off_sharp),
                                    ),
                                    hintText: '**********',
                                    filled: true,
                                    fillColor: AppColors.regWhite,
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(14.0)),
                                    )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                  onPressed: ()=> LoginScreenModelProvider.read(context)?.model.signIn(context),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      fixedSize: const Size(300, 48)),
                                  child: Text(
                                    "${AppLocalizations.of(context)?.signIn}",style: GoogleFonts.poppins(textStyle: const TextStyle(color: AppColors.mainWhite,fontWeight: FontWeight.w600,fontSize: 14)),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "${AppLocalizations.of(context)?.noAccount}"
                            ),
                            TextButton(
                                onPressed: createAccount,
                                child: Text(
                                    "${AppLocalizations.of(context)?.createAccount}"
                                )),
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
