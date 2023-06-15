import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../constants/app_colors.dart';
class ChatSelf extends StatelessWidget {
  const ChatSelf({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppColors.messageBackgroundUser,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            maxLines: null,
            message,
            style: AppStyles.s18w500roboto.copyWith(
                color: AppColors.mainWhite, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}