import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/repository/models/profile/followersPage/follower_followings_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../profile/profile.dart';

class SingleFollowingWidget extends StatelessWidget {
  const SingleFollowingWidget({Key? key,required this.follower}) : super(key: key);
  final FollowersFollowings follower;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileWidget(id: follower.followingUser!.id.toString(),)));
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhite,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${follower.followingUser?.fullName}',style: GoogleFonts.inter(textStyle: AppStyles.s18w700.copyWith(fontSize: 14,color: AppColors.mainBlack))),
                    Text('@${follower.followingUser?.login}',style: GoogleFonts.inter(textStyle: AppStyles.s13w400.copyWith(fontSize: 12,color: AppColors.mainBlack))),
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
