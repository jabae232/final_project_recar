import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/screens/profile/widgets/club_screen/data/bloc/profile_clubs_screen_bloc.dart';
import 'package:car_m/ui/screens/profile/widgets/club_screen/ui/widgets/single_club_widget_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../constants/app_colors.dart';

class ProfileClubsScreen extends StatefulWidget {
  const ProfileClubsScreen({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<ProfileClubsScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ProfileClubsScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileClubsScreenBloc>(context)
        .add(GetClubsProfileEvent(id: widget.id));
    return const _ClubScreenBody();
  }
}

class _ClubScreenBody extends StatelessWidget {
  const _ClubScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    '${AppLocalizations.of(context)?.clubs}',
                    style: AppStyles.s24w700.copyWith(color: Colors.black),
                  )),
            ),
          ];
        },
        body: BlocBuilder<ProfileClubsScreenBloc, ProfileClubsScreenState>(
          builder: (context, state) {
            if (state is ProfileClubsScreenLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileClubsScreenLoadedState) {
              if (state.clubs.isNotEmpty) {
                return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SingleProfileClubWidget(club: state.clubs[index]);
                      },
                      itemCount: state.clubs.length,
                      shrinkWrap: true,
                    ));
              } else {
                return Center(
                  child: Text(
                    "${AppLocalizations.of(context)?.empty}",
                    style: AppStyles.s13w400
                        .copyWith(color: AppColors.iconButtonsNeutral),
                  ),
                );
              }
            }
            if (state is ProfileClubsScreenErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
