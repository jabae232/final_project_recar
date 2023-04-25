import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:car_m/ui/screens/profile/widgets/saves_screen/saves_profile_model.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/app_colors.dart';
import '../../../profile/widgets/post/post_widget_profile.dart';

class SavesScreenProfile extends StatefulWidget {
  const SavesScreenProfile({Key? key,required this.id}) : super(key: key);
  final String id;
  @override
  State<SavesScreenProfile> createState() => _SavesScreenProfileState();
}

class _SavesScreenProfileState extends State<SavesScreenProfile> {
  @override
  Widget build(BuildContext context) {
    final model = SavesScreenProfileModel(id: widget.id);
    return NotifierProvider(model: model, child: const _SavesScreenBody());
  }
}

class _SavesScreenBody extends StatelessWidget {
  const _SavesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SavesScreenProfileModel>(context);
    if (model == null) return const SizedBox.shrink();
    final savesList = model.saves;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return PostListRowWidget(post: savesList[index],model: model,);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 9,
                );
              },
              itemCount: savesList.length),
        ),
      ),
    );
  }
}

