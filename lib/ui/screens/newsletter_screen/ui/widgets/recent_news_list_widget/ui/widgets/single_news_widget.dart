import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../constants/app_colors.dart';

class SingleNewsLetterWidget extends StatelessWidget {
  const SingleNewsLetterWidget({Key? key,required this.announcement,required this.authorName,required this.date}) : super(key: key);
  final String announcement;
  final String authorName;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.images.testNews),
            const SizedBox(height: 15,),
            Text('$announcement',style: AppStyles.w400poppins.copyWith(fontWeight: FontWeight.w500,fontSize: 15),),
            Row(
              children: [
                CircleAvatar(),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(authorName,style: AppStyles.s12w300.copyWith(fontWeight: FontWeight.w400,color: AppColors.mainBlack),),
                      Text(date,style: AppStyles.s12w300.copyWith(color: AppColors.messages),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundBtn,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10.25),
                  child: SvgPicture.asset(AppAssets.svg.shareNewsProper,width: 24,height: 24,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
