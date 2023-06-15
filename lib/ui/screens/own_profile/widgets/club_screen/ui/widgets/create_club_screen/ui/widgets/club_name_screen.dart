import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../../../../constants/app_colors.dart';
import '../../../../../../../../../../constants/app_styles.dart';
import 'club_description_screen.dart';

class ClubNameScreen extends StatefulWidget {
  const ClubNameScreen({Key? key}) : super(key: key);

  @override
  State<ClubNameScreen> createState() => _ClubNameScreenState();
}

class _ClubNameScreenState extends State<ClubNameScreen> {
  bool isFieldNotEmpty = false;
  late TextEditingController textController;
  @override
  void initState() {
    textController = TextEditingController();
    textController.addListener(() {
      final isFieldNotEmpty = textController.text.isNotEmpty;
      setState(() {
        this.isFieldNotEmpty = isFieldNotEmpty;
      });
    });
    super.initState();
  }

  bool isButtonActive() {
    if (isFieldNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${AppLocalizations.of(context)?.createClub}',
                style: AppStyles.s18w700.copyWith(
                    color: AppColors.mainBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text('${AppLocalizations.of(context)?.nameOfClub}'),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  fillColor: AppColors.background,
                  filled: true,
                  border: OutlineInputBorder()),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  disabledForegroundColor: Colors.blue.withOpacity(0.38),
                  disabledBackgroundColor: Colors.blue.withOpacity(0.12),
                ),
                onPressed: isButtonActive()
                    ? (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClubDescriptionScreen(
                            clubName: textController.text,
                          )));
                }
                    : null,
                child: Text("${AppLocalizations.of(context)?.continee}",
                    style: AppStyles.s16w400.copyWith(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
