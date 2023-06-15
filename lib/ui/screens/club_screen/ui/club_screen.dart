import 'package:car_m/ui/screens/search_page/ui/widgets/clubs/ui/widgets/single_club_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants/app_styles.dart';
import '../../search_page/ui/widgets/clubs/data/bloc/club_screen_bloc.dart';

class ClubScreen extends StatefulWidget {
  const ClubScreen({Key? key}) : super(key: key);

  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: BlocBuilder<ClubScreenBloc, ClubScreenState>(
          builder: (context, state) {
            if (state is ClubScreenLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ClubScreenLoadedState) {
              return MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SingleClubWidget(club: state.clubsList[index]);
                    },
                    itemCount: state.clubsList.length,
                    shrinkWrap: true,
                  ));
            }
            if (state is ClubScreenErrorState) {
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
