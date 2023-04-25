import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:car_m/ui/screens/profile/widgets/followers/single_follower/single_follower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import 'followers_widget_model.dart';

class FollowersWidgetScreen extends StatefulWidget {
  const FollowersWidgetScreen({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<FollowersWidgetScreen> createState() => _FollowersWidgetScreenState();
}

class _FollowersWidgetScreenState extends State<FollowersWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    final model = FollowersWidgetScreenModel(id: widget.id);
    return NotifierProvider(model: model, child: const FollowersScreenBody());
  }
}

class FollowersScreenBody extends StatelessWidget {
  const FollowersScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<FollowersWidgetScreenModel>(context);
    if (model == null) return const SizedBox.shrink();
    final followersList = model.followers;
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
                  child: Text(
                    '${AppLocalizations.of(context)?.followers}',
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
            child: followersList.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return SingleFollowerProfileWidget(
                        follower: followersList[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 0.1,
                      );
                    },
                    itemCount: followersList.length)
                : Center(
                    child: Text(
                      '${AppLocalizations.of(context)?.empty}',
                      style: AppStyles.s14w500
                          .copyWith(color: AppColors.iconButtonsNeutral),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
