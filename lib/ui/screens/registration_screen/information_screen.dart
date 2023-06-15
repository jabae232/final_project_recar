import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import 'information_screen_model.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPage();
}

class _InformationPage extends State<InformationPage> {
  bool isChecked = false;
  final model = InformationScreenModel();
  @override
  Widget build(BuildContext context) {
    return InformationScreenModelProvider(
      model: model,
      child: const _InformationScreenBody(),
    );
  }
}

class _InformationScreenBody extends StatefulWidget {
  const _InformationScreenBody({Key? key}) : super(key: key);

  @override
  State<_InformationScreenBody> createState() => _InformationScreenBodyState();
}

class _InformationScreenBodyState extends State<_InformationScreenBody> {
  final focusOne = FocusNode();
  final focusTwo = FocusNode();
  final focusThree = FocusNode();
  final focusFour = FocusNode();
  final focusFive = FocusNode();
  @override
  Widget build(BuildContext context) {
    void pressedButton() {
      InformationScreenModelProvider.read(context)
          ?.model
          .createAccount(context);
      InformationScreenModelProvider.read(context)?.model.signUp(context);
    }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "${AppLocalizations.of(context)?.personalInfo}",
                style: AppStyles.s21w500,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 46,
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: AppColors.regWhite,
                        child: Icon(
                          Icons.photo_camera_outlined,
                          color: Colors.blue,
                          size: 34,
                        ),
                      )),
                  const SizedBox(
                    width: 24,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        TextField(
                          textInputAction: TextInputAction.next,
                          focusNode: focusOne,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              errorText:
                                  InformationScreenModelProvider.watch(context)
                                      ?.model
                                      .errorName,
                              errorMaxLines: 3,
                              hintText: "${AppLocalizations.of(context)?.name}",
                              fillColor: AppColors.regWhite,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14.0),
                                ),
                              )),
                          onChanged: (value) =>
                              InformationScreenModelProvider.read(context)
                                  ?.model
                                  .firstName = value,
                          onSubmitted: (value) => FocusScope.of(context).requestFocus(focusTwo),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          onSubmitted: (value) => FocusScope.of(context).requestFocus(focusThree),
                          focusNode: focusTwo,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              errorText:
                                  InformationScreenModelProvider.watch(context)
                                      ?.model
                                      .errorSecondName,
                              hintText:
                                  "${AppLocalizations.of(context)?.surname}",
                              fillColor: AppColors.regWhite,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14.0),
                                ),
                              )),
                          onChanged: (value) =>
                              InformationScreenModelProvider.read(context)
                                  ?.model
                                  .secondName = value,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                onSubmitted: (value) => FocusScope.of(context).requestFocus(focusFour),
                focusNode: focusThree,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    errorText: InformationScreenModelProvider.watch(context)
                        ?.model
                        .errorLogin,
                    errorMaxLines: 3,
                    hintText: "${AppLocalizations.of(context)?.login}",
                    fillColor: AppColors.regWhite,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(14.0),
                      ),
                    )),
                onChanged: (value) =>
                    InformationScreenModelProvider.read(context)
                        ?.model
                        .nickname = value,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: pressedButton,
                  child: Text("${AppLocalizations.of(context)?.continee}",
                      style: AppStyles.s16w400.copyWith(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
