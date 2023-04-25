import 'package:car_m/ui/screens/registration_screen/passwords_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final model = PasswordScreenModel();
    return PasswordScreenModelProvider(
        model: model, child: const _PasswordScreenBody());
  }
}

class _PasswordScreenBody extends StatefulWidget {
  const _PasswordScreenBody({Key? key}) : super(key: key);

  @override
  State<_PasswordScreenBody> createState() => _PasswordScreenBodyState();
}

class _PasswordScreenBodyState extends State<_PasswordScreenBody> {
  bool checkFirstField = true;
  bool checkSecondField = true;
  bool isFieldNotEmpty = false;
  late TextEditingController passwordController;
  late TextEditingController confirmationController;
  @override
  void initState() {
    passwordController = TextEditingController();
    confirmationController = TextEditingController();
    passwordController.addListener(() {
      final isFieldNotEmpty = passwordController.text.isNotEmpty;
      setState(() {
        this.isFieldNotEmpty = isFieldNotEmpty;
      });
    });
    confirmationController.addListener(() {
      final isFieldNotEmpty = passwordController.text.isNotEmpty;
      setState(() {
        this.isFieldNotEmpty = isFieldNotEmpty;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    passwordController.dispose();
    confirmationController.dispose();
    super.dispose();
  }
  bool isButtonActive() {
    if(isFieldNotEmpty) {
      return passwordController.text == confirmationController.text;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.blue,
        ),
        backgroundColor: AppColors.mainWhite,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(AppAssets.svg.logo,width: 50,height: 40,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "${AppLocalizations.of(context)?.createPass}",
                style: AppStyles.s21w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "${AppLocalizations.of(context)?.protectAccount}",
                maxLines: 3,
                style: AppStyles.s16w400.copyWith(color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: passwordController,
                obscuringCharacter: '・',
                decoration: InputDecoration(
                    hintText: "${AppLocalizations.of(context)?.enterPass}",
                    fillColor: AppColors.regWhite,
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (checkFirstField == true) {
                          checkFirstField = false;
                        } else {
                          checkFirstField = true;
                        }
                        PasswordScreenModelProvider.watch(context)
                            ?.model
                            .visibility = checkFirstField;
                      },
                      icon: checkFirstField
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off_sharp),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(14.0),
                      ),
                    )),
                obscureText: checkFirstField,
                onEditingComplete: () =>
                    PasswordScreenModelProvider.read(context)
                        ?.model
                        .createAccount(context),
                onChanged: (value) => PasswordScreenModelProvider.read(context)
                    ?.model
                    .password = value,
              ),
            ),
            TextField(
              controller: confirmationController,
              obscuringCharacter: '・',
              obscureText: checkSecondField,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (checkSecondField == true) {
                        checkSecondField = false;
                      } else {
                        checkSecondField = true;
                      }
                      PasswordScreenModelProvider.watch(context)
                          ?.model
                          .visibilitySecond = checkSecondField;
                    },
                    icon: checkSecondField
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off_sharp),
                  ),
                  hintText: "${AppLocalizations.of(context)?.confirmThePass}",
                  fillColor: AppColors.regWhite,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14.0),
                    ),
                  )),
              onEditingComplete: () => PasswordScreenModelProvider.read(context)
                  ?.model
                  .createAccount(context),
              onChanged: (value) => PasswordScreenModelProvider.read(context)
                  ?.model
                  .password = value,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.blue.withOpacity(0.38), disabledBackgroundColor: Colors.blue.withOpacity(0.12),
                    ),
                      onPressed: isButtonActive() ? () => PasswordScreenModelProvider.read(context)
                          ?.model
                          .createAccount(context) : null,
                      child: Text("${AppLocalizations.of(context)?.continee}",
                          style: AppStyles.s16w400
                              .copyWith(color: Colors.white)))),
            ),
          ],
        ),
      ),
    );
  }
}
