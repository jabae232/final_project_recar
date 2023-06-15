import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/ui/screens/own_profile/data/bloc/own_profile_bloc.dart';
import 'package:car_m/ui/screens/own_profile/widgets/all_posts.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/club_screen.dart';
import 'package:car_m/ui/screens/own_profile/widgets/posts/ui/post_widget.dart';
import 'package:car_m/ui/screens/own_profile/widgets/saves_screen/ui/saves_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../navigation/main_navigation.dart';
import '../../club_screen/ui/club_screen.dart';
import '../widgets/edit_profile/edit_profile.dart';
import '../widgets/followers/ui/followers_screen.dart';
import '../widgets/followings/ui/following_screen.dart';

class OwnProfileScreen extends StatefulWidget {
  const OwnProfileScreen({super.key});
  @override
  State<OwnProfileScreen> createState() => _OwnProfileScreenState();
}

class _OwnProfileScreenState extends State<OwnProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<OwnProfileBloc>(context).add(GetOwnProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileWidgetBody();
  }
}

class ProfileWidgetBody extends StatefulWidget {
  const ProfileWidgetBody({super.key});
  @override
  State<ProfileWidgetBody> createState() => _OwnProfileWidgetBodyState();
}

class _OwnProfileWidgetBodyState extends State<ProfileWidgetBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.poppins(textStyle: AppStyles.s13w400)
        .copyWith(color: AppColors.mainBlack);
    return Scaffold(
      body: BlocBuilder<OwnProfileBloc, OwnProfileState>(
        builder: (context, state) {
          if (state is OwnProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is OwnProfileLoadedState) {
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: const BackButton(),
                    backgroundColor: Colors.black,
                    pinned: true,
                    snap: false,
                    floating: false,
                    title: Text('@${state.profile.user.login}'),
                    expandedHeight: 140.0,
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: state.profile.user.backgroundPhoto == null
                            ? Image.asset(
                                AppAssets.images.testBackGroundProfile,
                                fit: BoxFit.fitWidth,
                              )
                            : Image.network(
                                'http://89.223.100.35:8080${state.profile.user.backgroundPhoto!.dowloadUri}',
                                fit: BoxFit.fitWidth,
                              )),
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
                                    state.profile.user.avatar == null
                                        ? AssetImage(AppAssets.images.testNews)
                                            as ImageProvider
                                        : NetworkImage(
                                            'http://89.223.100.35:8080${state.profile.user.avatar?.dowloadUri}',
                                          ),
                                backgroundColor: Colors.transparent,
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${state.profile.user.fullName}',
                                    style: AppStyles.w400poppins.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.mainWhite),
                                  ),
                                  Text(
                                    '@${state.profile.user.username}',
                                    style: GoogleFonts.inter(
                                            textStyle: AppStyles.s16w400)
                                        .copyWith(color: AppColors.mainWhite),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FollowersScreen(
                                                      id: '',
                                                    )));
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                              '${state.profile.followers.length}',
                                              style: GoogleFonts.inter(
                                                      textStyle:
                                                          AppStyles.s24w700)
                                                  .copyWith(
                                                      color:
                                                          AppColors.mainWhite)),
                                          Text(
                                              "${AppLocalizations.of(context)?.followers}",
                                              style: GoogleFonts.inter(
                                                      textStyle:
                                                          AppStyles.s16w400)
                                                  .copyWith(
                                                      color:
                                                          AppColors.mainWhite)),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FollowingScreen(
                                                      id: '',
                                                    )));
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            '${state.profile.following.length}',
                                            style: GoogleFonts.inter(
                                                    textStyle:
                                                        AppStyles.s24w700)
                                                .copyWith(
                                                    color: AppColors.mainWhite),
                                          ),
                                          Text(
                                              "${AppLocalizations.of(context)?.followings}",
                                              style: GoogleFonts.inter(
                                                      textStyle:
                                                          AppStyles.s16w400)
                                                  .copyWith(
                                                      color:
                                                          AppColors.mainWhite)),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OwnClubsScreen())),
                                      child: Column(
                                        children: [
                                          Text('${state.profile.clubs.length}',
                                              style: GoogleFonts.inter(
                                                      textStyle:
                                                          AppStyles.s24w700)
                                                  .copyWith(
                                                      color:
                                                          AppColors.mainWhite)),
                                          Text(
                                              "${AppLocalizations.of(context)?.clubs}",
                                              style: GoogleFonts.inter(
                                                      textStyle:
                                                          AppStyles.s16w400)
                                                  .copyWith(
                                                      color:
                                                          AppColors.mainWhite)),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfileScreen(
                                                fullName: state
                                                    .profile.user.fullName!,
                                              )));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.buttonNeutral,
                                    foregroundColor: Colors.blue,
                                    padding: const EdgeInsets.all(10),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.edit),
                                    Text(
                                      "${AppLocalizations.of(context)?.edit}",
                                      style: GoogleFonts.poppins(
                                          textStyle: AppStyles.s14w500),
                                    ),
                                  ],
                                ),
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () => Navigator.push(context,
                                      MainNavigationPush().createPostWidget),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.buttonNeutral,
                                      foregroundColor: Colors.blue,
                                      padding: const EdgeInsets.all(10),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      )),
                                  child: FittedBox(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.post_add),
                                      Text(
                                        "${AppLocalizations.of(context)?.createPost}",
                                        style: GoogleFonts.poppins(
                                            textStyle: AppStyles.w400poppins
                                                .copyWith(color: Colors.blue)),
                                      ),
                                    ],
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                ];
              },
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TabBar(
                      controller: tabController,
                      tabs: [
                        Tab(
                          child: Text(
                            "${AppLocalizations.of(context)?.all}",
                            style: style,
                          ),
                        ),
                        Tab(
                          child: Text(
                            "${AppLocalizations.of(context)?.posts}",
                            style: style,
                          ),
                        ),
                        Tab(
                          child: FittedBox(
                              child: Text(
                            "${AppLocalizations.of(context)?.saves}",
                            style: style,
                            maxLines: 1,
                          )),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          OwnPostsWidget(),
                          PostWidgets(),
                          SavesScreen(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is OwnProfileErrorState) {
            return const Center(
              child: Text('Something went wrong :('),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
