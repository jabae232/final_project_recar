import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/ui/screens/profile/data/bloc/profile_screen_bloc.dart';
import 'package:car_m/ui/screens/profile/widgets/all_posts.dart';
import 'package:car_m/ui/screens/profile/widgets/followers/ui/profile_screen_follower.dart';
import 'package:car_m/ui/screens/profile/widgets/saves_screen/ui/saves_widget_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../widgets/club_screen/ui/club_screen_profile.dart';
import '../widgets/followings/ui/profile_following_screen.dart';
import '../widgets/post/ui/post_widget_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.id});
  final String id;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileScreenBloc>(context)
        .add(GetProfileEvent(profileId: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileWidgetBody(
      id: widget.id,
    );
  }
}

class ProfileWidgetBody extends StatefulWidget {
  const ProfileWidgetBody({super.key, required this.id});
  final String id;
  @override
  State<ProfileWidgetBody> createState() => _ProfileWidgetBodyState();
}

class _ProfileWidgetBodyState extends State<ProfileWidgetBody>
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
      body: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
        builder: (context, state) {
          if (state is ProfileScreenLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileScreenLoaded) {
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
                                  FittedBox(
                                    child: Text(
                                      '${state.profile.user.fullName}',
                                      style: AppStyles.w400poppins.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.mainWhite,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '@${state.profile.user.login}',
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
                                                  FollowersScreen(
                                                      id: state.profile.user.id
                                                          .toString())));
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
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileFollowingScreen(
                                                      id: state.profile.user.id
                                                          .toString(),
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
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileClubsScreen(
                                                    id: state.profile.user.id
                                                        .toString(),
                                                  )));
                                    },
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
                                    ),
                                  ),
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
                                child: SizedBox(
                                  width: 121,
                                  child: state.followedProfile
                                      ? ElevatedButton(
                                          onPressed: null,
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          )),
                                          child: Text(
                                            "${AppLocalizations.of(context)?.followed}",
                                            style: GoogleFonts.poppins(
                                                textStyle: AppStyles.s14w500.copyWith(color: AppColors.mainWhite)),
                                          ),
                                        )
                                      : ElevatedButton(
                                          onPressed: () {
                                            BlocProvider.of<ProfileScreenBloc>(
                                                context)
                                              ..add(FollowProfileEvent(
                                                  profileId: state
                                                      .profile.user.id
                                                      .toString()))
                                              ..add(GetProfileEvent(
                                                  profileId: state
                                                      .profile.user.id
                                                      .toString()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          )),
                                          child: Text(
                                            "${AppLocalizations.of(context)?.follow}",
                                            style: GoogleFonts.poppins(
                                                textStyle: AppStyles.s14w500),
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 121,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.mainWhite,
                                          foregroundColor: AppColors.mainBlack,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          )),
                                      child: Text(
                                        "${AppLocalizations.of(context)?.message}",
                                        style: GoogleFonts.poppins(
                                            textStyle: AppStyles.s14w500),
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
                        children: [
                          const PostsWidget(),
                          PostWidgetProfile(
                            id: widget.id,
                          ),
                          SavesScreenProfile(id: widget.id),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is ProfileScreenError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
