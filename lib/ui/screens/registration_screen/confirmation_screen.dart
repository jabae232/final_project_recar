import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_colors.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPage();
}

class _ConfirmationPage extends State<ConfirmationPage> {
  bool isChecked = false;
  void pressedButton(){
    Navigator.push(context, MainNavigationPush().information);
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
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
        child: Column(
          children: [
             Text("${AppLocalizations.of(context)?.twoStepVerificiation}",style: AppStyles.s21w500,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Text("${AppLocalizations.of(context)?.receivingPhoneCall}",maxLines: 3,style: AppStyles.s16w400.copyWith(color: Colors.blueGrey),textAlign: TextAlign.center,),),
            Text("${AppLocalizations.of(context)?.lastFourdigits}",maxLines: 3,style: AppStyles.s16w400.copyWith(color: Colors.blueGrey),textAlign: TextAlign.center,),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp("[0-9]")),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "${AppLocalizations.of(context)?.enterCode}",
                    fillColor: Colors.white12,
                    filled: true,
                    contentPadding:  const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0
                    ),
                    border: const OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(14.0)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(onPressed: pressedButton, child: Text("${AppLocalizations.of(context)?.continee}",style: AppStyles.s16w400.copyWith(color: Colors.white)))),
            ),
            Text("${AppLocalizations.of(context)?.confirmInAnother}",style: AppStyles.s18w700.copyWith(color: Colors.blue,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
