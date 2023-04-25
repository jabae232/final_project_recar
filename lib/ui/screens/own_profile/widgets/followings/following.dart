import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followers/single_follower/single_follower.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followings/single_following/single_following.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import 'following_model.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key,required this.id}) : super(key: key);
  final String id;
  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  @override
  Widget build(BuildContext context) {
    final model = FollowingScreenModel(id: widget.id);
    return NotifierProvider(model: model, child: const FollowersScreenBody());
  }
}

class FollowersScreenBody extends StatelessWidget {
  const FollowersScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<FollowingScreenModel>(context);
    if (model == null) return const SizedBox.shrink();
    final followingList = model.followings;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: const BackButton(
                color: Colors.blue,
              ),
              elevation: 0,
              pinned: true,
              backgroundColor: AppColors.background,
              title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
                  child: Text(
                    '${AppLocalizations.of(context)?.followings}',
                    style: AppStyles.s24w700.copyWith(color: Colors.black),
                  )),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return SingleFollowingWidget(
                    follower: followingList[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 0.1,
                  );
                },
                itemCount: followingList.length),
          ),
        ),
      ),
    );
  }
}
