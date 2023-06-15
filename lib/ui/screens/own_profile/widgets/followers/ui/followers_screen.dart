import 'package:car_m/resources/constants/notifierProvider.dart';
import 'package:car_m/ui/screens/own_profile/widgets/followers/single_follower/single_follower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../data/bloc/followers_bloc.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FollowersBloc>(context).add(GetFollowersEvent(id: widget.id));
    return const FollowersScreenBody();
  }
}

class FollowersScreenBody extends StatelessWidget {
  const FollowersScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<FollowersBloc, FollowersState>(
    builder: (context, state) {
      if(state is FollowersLoadingState) {
        return const Center(child: CircularProgressIndicator(),);
      } if (state is FollowersLoadedState) {
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
              child:  state.followers.length > 0 ? ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return SingleFollowerWidget(
                      follower: state.followers[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 0.1,
                    );
                  },
                  itemCount: state.followers.length) : Center(child: Text('${AppLocalizations.of(context)?.empty}'),),
            ),
          ),
        );
      }
        if (state is FollowersErrorState) {
          return const Center(child: Text("Something went wrong"),);
        }
        return const SizedBox.shrink();
  },
),
    );
  }
}
