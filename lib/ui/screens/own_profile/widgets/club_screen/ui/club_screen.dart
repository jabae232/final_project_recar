import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/data/bloc/own_clubs_screen_bloc.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/create_club_screen/ui/create_club_screen.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/single_club_widget/single_club_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../constants/app_colors.dart';


class OwnClubsScreen extends StatefulWidget {
  const OwnClubsScreen({Key? key}) : super(key: key);

  @override
  State<OwnClubsScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<OwnClubsScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OwnClubsScreenBloc>(context).add(GetOwnClubs());
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
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateClubScreen()));
                }, icon: Icon(Icons.add,color: Colors.blue,)),
              ],
            ),
          ];
        },
        body: BlocBuilder<OwnClubsScreenBloc, OwnClubsScreenState>(
          builder: (context, state) {
            if (state is OwnClubsScreenLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is OwnClubsScreenLoaded) {
              if (state.clubs.isNotEmpty) {
                return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SingleOwnClubWidget(club: state.clubs[index]);
                      },
                      itemCount: state.clubs.length,
                      shrinkWrap: true,
                    ));
              } else {
                return Center(child: Text("${AppLocalizations.of(context)?.empty}",style: AppStyles.s13w400.copyWith(color: AppColors.iconButtonsNeutral),),);
              }
            }
            if (state is OwnClubsScreenError) {
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
