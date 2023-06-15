import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constants/app_assets.dart';
import '../../../../../../../constants/app_colors.dart';

class GalleryClubWidget extends StatelessWidget {
  const GalleryClubWidget({Key? key, required this.controller})
      : super(key: key);
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    final images = [
      Image.asset(AppAssets.images.testBackGroundProfile),
      Image.asset(AppAssets.images.testBackGroundProfile),
      Image.asset(AppAssets.images.testBackGroundProfile),
      Image.asset(AppAssets.images.testBackGroundProfile),
      Image.asset(AppAssets.images.testBackGroundProfile),
      Image.asset(AppAssets.images.testBackGroundProfile),
      Image.asset(AppAssets.images.testBackGroundProfile),
      Image.asset(AppAssets.images.testBackGroundProfile),
      Image.asset(AppAssets.images.testBackGroundProfile),
    ];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainWhite,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 15,
              offset: const Offset(0, 7),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Gallery",
                style: AppStyles.s18w500roboto.copyWith(
                    color: AppColors.mainBlack, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  height: 1,
                  color: Colors.blue,
                  width: 25,
                ),
              ),
              Expanded(
                  child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: images,
                mainAxisSpacing: 12,
                crossAxisSpacing: 10,
                controller: controller,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
