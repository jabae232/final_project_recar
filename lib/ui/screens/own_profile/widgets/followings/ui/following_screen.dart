import 'package:car_m/ui/screens/own_profile/widgets/followings/single_following/single_following.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../data/bloc/following_screen_bloc.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key,required this.id}) : super(key: key);
  final String id;
  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  @override
  void initState() {
    BlocProvider.of<FollowingScreenBloc>(context).add(GetFollowingEvent(id: widget.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const FollowersScreenBody();
  }
}

class FollowersScreenBody extends StatelessWidget {
  const FollowersScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<FollowingScreenBloc, FollowingScreenState>(
      builder: (context, state) {
        if(state is FollowingScreenLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        } if(state is FollowingScreenLoadedState) {
          return NestedScrollView(
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
                child: state.followings.length > 0 ? ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return SingleFollowingWidget(
                        follower: state.followings[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 0.1,
                      );
                    },
                    itemCount: state.followings.length) : Center(child: Text('${AppLocalizations.of(context)?.empty}'),),
              ),
            ),
          );
        } if (state is FollowingScreenErrorState) {
          return const Center(child: Text('Something went wrong'),);
        } return const SizedBox.shrink();
  },
),
    );
  }
}
