import 'package:car_m/ui/screens/search_page/ui/widgets/clubs/ui/widgets/single_club_widget.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/clubs/data/bloc/club_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../constants/app_colors.dart';


class ClubsScreen extends StatefulWidget {
  const ClubsScreen({Key? key}) : super(key: key);

  @override
  State<ClubsScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubsScreen> {
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
      body: BlocBuilder<ClubScreenBloc, ClubScreenState>(
        builder: (context, state) {
          if (state is ClubScreenLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ClubScreenLoadedState) {
            if (state.clubsList.length > 0) {
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
            } else {
              return Center(child: Text('${AppLocalizations.of(context)?.empty}'),);
            }
          }
          if (state is ClubScreenErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
