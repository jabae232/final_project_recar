import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/screens/services/services_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../constants/app_colors.dart';
import '../../../main.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final model = ServicesPageModel();
  @override
  Widget build(BuildContext context) {
    return ServicesPageModelProvider(model: model, child: const _ServicesPageBody());
  }
}

class _ServicesPageBody extends StatelessWidget {
  const _ServicesPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${AppLocalizations.of(context)?.services}"),
          elevation: 0,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${AppLocalizations.of(context)?.language}'),
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
            InkWell(
              onTap: () => ServicesPageModelProvider.read(context)?.model.leave(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.exit_to_app,color: Colors.red,size: 30,)),
                  Text("${AppLocalizations.of(context)?.exit}",style: AppStyles.s18w700.copyWith(color: AppColors.mainBlack),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

