import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../navigation/profile_router.dart';
import '../../../own_profile/ui/own_profile_screen.dart';
import '../../../profile/ui/profile_screen.dart';
import '../../data/dto/events.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParticipantsScreen extends StatelessWidget {
  const ParticipantsScreen({Key? key, required this.members}) : super(key: key);
  final List<Member> members;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.mainBlack,
              leading: const BackButton(
                color: Colors.blue,
              ),
              title: Text('${AppLocalizations.of(context)?.participants}'),
            )
          ];
        },
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(itemBuilder: (context, index) {
              return SingleParticipantWidget(
                member: members[index],
              );
            },itemCount: members.length,)),
      ),
    );
  }
}

class SingleParticipantWidget extends StatelessWidget {
  const SingleParticipantWidget({Key? key, required this.member})
      : super(key: key);
  final Member member;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: InkWell(
        onTap: () async {
          if (await ProfileRouter().checkProfile(member.login)) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OwnProfileScreen()));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen(id: member.id.toString())));
          }
        },
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: member.avatar == null
                      ? AssetImage(AppAssets.images.testNews) as ImageProvider
                      : NetworkImage(
                          'http://89.223.100.35:8080${member.avatar?.dowloadUri}',
                        ),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${member.fullName}',
                        style: GoogleFonts.inter(
                            textStyle: AppStyles.s18w700.copyWith(
                                fontSize: 14, color: AppColors.mainBlack))),
                    Text('@${member.login}',
                        style: GoogleFonts.inter(
                            textStyle: AppStyles.s13w400.copyWith(
                                fontSize: 12, color: AppColors.mainBlack))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
