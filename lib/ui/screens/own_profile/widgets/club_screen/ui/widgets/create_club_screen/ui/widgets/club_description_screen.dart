import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/create_club_screen/ui/widgets/bloc/club_creation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../../../../constants/app_colors.dart';
import '../../../../../../../../../../constants/app_styles.dart';
import '../../../../../../../../../navigation/main_navigation.dart';
class ClubDescriptionScreen extends StatefulWidget {
  const ClubDescriptionScreen({Key? key,required this.clubName}) : super(key: key);
  final String clubName;
  @override
  State<ClubDescriptionScreen> createState() => _ClubDescriptionScreenState();
}

class _ClubDescriptionScreenState extends State<ClubDescriptionScreen> {
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
    if(isFieldNotEmpty) {
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
                '${AppLocalizations.of(context)?.fillDescription}',
                style: AppStyles.s18w700.copyWith(
                    color: AppColors.mainBlack, fontWeight: FontWeight.bold,fontSize: 27),
              ),
            ),
            Center(
              child: Text(
                '${AppLocalizations.of(context)?.whyClubInteresting}',
                style: AppStyles.s18w700.copyWith(
                    color: AppColors.mainBlack,),
              ),
            ),
            const SizedBox(height: 40,),
            Text('${AppLocalizations.of(context)?.description}'),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  hintText: '${AppLocalizations.of(context)?.addDescription}',
                  fillColor: AppColors.background,
                  filled: true,
                  border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  disabledForegroundColor: Colors.blue.withOpacity(0.38), disabledBackgroundColor: Colors.blue.withOpacity(0.12),
                ),
                onPressed: isButtonActive() ? (){
                  BlocProvider.of<ClubCreationBloc>(context).add(CreateClubEvent(name: widget.clubName, description: textController.text));
                  Navigator.of(context)
                      .pushReplacementNamed(MainNavigationRouteNames.mainRoute);
                } : null,
                child: Text("${AppLocalizations.of(context)?.continee}",
                    style: AppStyles.s16w400
                        .copyWith(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
