import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';

class DateTime extends StatelessWidget {
  const DateTime({Key? key,required this.date}) : super(key: key);
  final String date;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Text(date,style: AppStyles.s18w500roboto.copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.messages),),
    );
  }
}
