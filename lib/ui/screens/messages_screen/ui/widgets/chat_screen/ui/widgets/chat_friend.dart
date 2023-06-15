import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../constants/app_colors.dart';

class ChatFriend extends StatelessWidget {
  const ChatFriend({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.messageBackgroundFriend,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            maxLines: null,
            message,
            style: AppStyles.s18w500roboto.copyWith(
                color: AppColors.mainBlack, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
