import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/selected_club_screen/ui/widgets/create_event_screen/ui/create_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../../constants/app_assets.dart';
import '../../../../../../../../../constants/app_colors.dart';
import '../../../../../../../../../constants/app_styles.dart';
import '../data/bloc/selected_club_bloc.dart';

class SelectedClubScreen extends StatefulWidget {
  const SelectedClubScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<SelectedClubScreen> createState() => _SelectedClubScreenState();
}

class _SelectedClubScreenState extends State<SelectedClubScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SelectedClubBloc>(context)
        .add(GetSelectedClubEvent(id: widget.id));
    return const _SelectedClubBody();
  }
}

class _SelectedClubBody extends StatelessWidget {
  const _SelectedClubBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<SelectedClubBloc, SelectedClubState>(
        builder: (context, state) {
          if (state is SelectedClubLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SelectedClubLoadedState) {
            for (int i = 0; i < state.club.admins.length; i++) {
              if (state.username == state.club.admins[i].login) {
                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: AppColors.mainBlack,
                        leading: const BackButton(
                          color: Colors.white,
                        ),
                        title: Text(state.club.name),
                        pinned: true,
                        snap: false,
                        floating: false,
                        expandedHeight: 140.0,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          background: Image.asset(
                            AppAssets.images.testBackGroundProfile,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                            child: Container(
                          padding: const EdgeInsets.all(13),
                          color: AppColors.mainBlack,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 46,
                                    backgroundImage:
                                        AssetImage(AppAssets.images.testNews),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${state.club.name}',
                                        style: AppStyles.w400poppins.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: AppColors.mainWhite),
                                      ),
                                      Text(
                                        '${state.club.user.length} ${AppLocalizations.of(context)?.members}',
                                        style: AppStyles.s12w300.copyWith(
                                            color: AppColors.mainWhite),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black
                                        ),
                                          onPressed: () {},
                                          child: Text(
                                              '${AppLocalizations.of(context)?.createPost}')),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black
                                        ),
                                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEventScreen(club: state.club,))),
                                          child: Text(
                                              '${AppLocalizations.of(context)?.createEvent}')),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                      ),
                    ];
                  },
                  body: Center(child: Text('${AppLocalizations.of(context)?.empty}')),
                );
              } else {
                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: AppColors.mainBlack,
                        leading: const BackButton(
                          color: Colors.white,
                        ),
                        title: Text(state.club.name),
                        pinned: true,
                        snap: false,
                        floating: false,
                        expandedHeight: 140.0,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          background: Image.asset(
                            AppAssets.images.testBackGroundProfile,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              color: AppColors.mainBlack,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 46,
                                        backgroundImage:
                                        AssetImage(AppAssets.images.testNews),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${state.club.name}',
                                            style: AppStyles.w400poppins.copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: AppColors.mainWhite),
                                          ),
                                          Text(
                                            '${state.club.user.length} ${AppLocalizations.of(context)?.members}',
                                            style: AppStyles.s12w300.copyWith(
                                                color: AppColors.mainWhite),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                  '${AppLocalizations.of(context)?.subscribe}')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ];
                  },
                  body: Center(child: Text('${AppLocalizations.of(context)?.empty}')),
                );
              }
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
