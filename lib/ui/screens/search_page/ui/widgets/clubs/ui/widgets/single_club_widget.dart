import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../constants/app_colors.dart';
import '../../data/bloc/club_screen_bloc.dart';
import '../../data/dto/clubs.dart';

class SingleClubWidget extends StatelessWidget {
  const SingleClubWidget({Key? key, required this.club}) : super(key: key);
  final ClubsDto club;
  @override
  Widget build(BuildContext context) {
    print(club.description);
    return Padding(
      padding: const EdgeInsets.all(9),
      child: InkWell(
        onTap: () {
          /* Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileWidget(id: follower.followingUser!.id.toString(),)));*/
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
                const CircleAvatar(),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${club.name}',
                          style: AppStyles.w400poppins.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.mainBlack)),
                      Text('${club.description}',
                          style: AppStyles.w400poppins.copyWith(
                              fontSize: 12, color: AppColors.mainBlack)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: (){
                      BlocProvider.of<ClubScreenBloc>(context).add(ClubSubEvent(id: club.id.toString()));
                    },
                    child: SvgPicture.asset(
                      AppAssets.svg.subscribe,
                      color: AppColors.messageBackgroundUser,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
