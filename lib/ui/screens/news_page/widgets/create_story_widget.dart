import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/app_colors.dart';

class CreateStoryWidget extends StatelessWidget {
  const CreateStoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppAssets.svg.rect64,color: AppColors.neutralStoryIcon,),
            SvgPicture.asset(AppAssets.svg.rect48,color: AppColors.neutralStoryIcon),
            const Icon(Icons.add,color: AppColors.mainWhite,),
          ],
        ),
        const SizedBox(height: 11,),
        Text('Add Story',style: GoogleFonts.poppins(textStyle: AppStyles.s16w400.copyWith(color: AppColors.mainWhite)),)
      ],
    );
  }
}
