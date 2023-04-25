import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/screens/registration_screen/registration_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final model = RegistrationFormModel();

  @override
  Widget build(BuildContext context) {
    return RegistrationFormModelProvider(
      model: model,
      child: _RegistrationPageBody(),
    );
  }
}

class _RegistrationPageBody extends StatefulWidget {
  _RegistrationPageBody({Key? key}) : super(key: key);

  @override
  State<_RegistrationPageBody> createState() => _RegistrationPageBodyState();
}

class _RegistrationPageBodyState extends State<_RegistrationPageBody> {
  bool isChecked = false;
  late TextEditingController phoneController;
  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    void checkBox() {
      isChecked = !isChecked;
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
        child: Column(
          children: [
             Text(
              "${AppLocalizations.of(context)?.enterNumber}",
              style: AppStyles.s21w500,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Text(
                "${AppLocalizations.of(context)?.yourPhoneNumberWillBeUsed}",
                maxLines: 3,
                style: AppStyles.s16w400.copyWith(color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: phoneController,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              textInputAction: TextInputAction.next,
              onSubmitted: (value) =>
                  RegistrationFormModelProvider.read(context)
                      !.model
                      .createAccount(context),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  errorText: RegistrationFormModelProvider.watch(context)
                      ?.model
                      .errorText,
                  hintText: "${AppLocalizations.of(context)?.enterYourPhoneNumber}",
                  fillColor: AppColors.regWhite,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14.0),
                    ),
                  )),
              onEditingComplete: () =>
                  RegistrationFormModelProvider.read(context)
                      ?.model
                      .createAccount(context),
              onChanged: (value) => RegistrationFormModelProvider.read(context)
                  ?.model
                  .number = value,
            ),
            Row(
              children: [
                InkWell(
                  onTap: checkBox,
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked, onChanged: (isChecked) {
                          isChecked = !isChecked!;
                        RegistrationFormModelProvider.watch(context)?.model.checkbox = isChecked;
                      },
                      ),
                      Text(
                        "${AppLocalizations.of(context)?.saveUser}",
                        style:
                            AppStyles.s16w400.copyWith(color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.help_outlined,
                  color: Colors.blueGrey,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () =>
                          RegistrationFormModelProvider.read(context)
                              ?.model
                              .createAccount(context),
                      child: Text("${AppLocalizations.of(context)?.continee}",
                          style: AppStyles.s16w400
                              .copyWith(color: Colors.white)))),
            ),
            Text(
              "${AppLocalizations.of(context)?.termsOfService}",
              style: AppStyles.s12w300.copyWith(
                  color: Colors.blueGrey, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
