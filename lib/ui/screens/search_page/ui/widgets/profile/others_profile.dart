import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/ui/screens/own_profile/ui/own_profile_screen.dart';
import 'package:car_m/ui/screens/search_page/ui/widgets/profile/search_for_profile_bloc/search_for_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../../navigation/profile_router.dart';
import '../../../../profile/ui/profile_screen.dart';
import 'dto/search_users.dart';

class OthersProfileWidget extends StatefulWidget {
  const OthersProfileWidget({Key? key}) : super(key: key);

  @override
  State<OthersProfileWidget> createState() => _OthersProfileWidgetState();
}

class _OthersProfileWidgetState extends State<OthersProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return const _OthersProfileWidgetBody();
  }
}

class _OthersProfileWidgetBody extends StatelessWidget {
  const _OthersProfileWidgetBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForProfileBloc, SearchForProfileState>(
      builder: (context, state) {
        if (state is SearchForProfileLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is SearchForProfileLoadedState) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return _OnePostRowWidget(
                        profile: state.usersList[index],
                        token: state.token,
                      );
                    },
                    itemCount: state.usersList.length),
              ),
            ),
          );
        }
        if (state is SearchForProfileErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Text('mistake');
      },
    );
  }
}

class _OnePostRowWidget extends StatelessWidget {
  const _OnePostRowWidget(
      {Key? key, required this.profile, required this.token})
      : super(key: key);
  final Users profile;
  final String token;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await ProfileRouter().checkProfile(profile.username)) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OwnProfileScreen()));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfileScreen(id: profile.id.toString())));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhite,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: profile.avatar == null
                        ? AssetImage(AppAssets.images.testNews) as ImageProvider
                        : NetworkImage(
                            'http://89.223.100.35:8080${profile.avatar?.dowloadUri}',
                          ),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${profile.fullName}',
                        style: AppStyles.s18w700.copyWith(
                            color: AppColors.mainBlack,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '@${profile.login}',
                        style:
                            AppStyles.s16w400.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
