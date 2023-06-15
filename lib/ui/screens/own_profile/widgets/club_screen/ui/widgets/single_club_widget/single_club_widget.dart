import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../constants/app_colors.dart';
import '../../../../posts/data/dto/posts_dto.dart';
import '../selected_club_screen/ui/selected_club_screen.dart';

class SingleOwnClubWidget extends StatelessWidget {
  const SingleOwnClubWidget({Key? key, required this.club}) : super(key: key);
  final Club club;
  @override
  Widget build(BuildContext context) {
    print(club.description);
    return Padding(
      padding: const EdgeInsets.all(9),
      child: InkWell(
        onTap: () {
          /* Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileWidget(id: follower.followingUser!.id.toString(),)));*/
        },
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedClubScreen(id: club.id.toString(),))),
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
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.asset(
                      AppAssets.svg.followed,
                      color: AppColors.messageBackgroundUser,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
