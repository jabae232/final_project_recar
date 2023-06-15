import 'package:car_m/secure_storage/shared_preferences.dart';
import 'package:car_m/ui/screens/own_profile/ui/own_profile_screen.dart';
import 'package:car_m/ui/screens/own_profile/widgets/comment_section/data/dto/comments.dart';
import 'package:car_m/ui/screens/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../constants/app_assets.dart';
import '../../../../../../../constants/app_colors.dart';
import '../../../../../../../constants/app_styles.dart';
import '../../../../../../../date_formatter/date_formatter.dart';
import '../../../../../../navigation/profile_router.dart';

class AllComments extends StatelessWidget {
  const AllComments({Key? key,required this.myfocus, required this.comments,required this.textController,}) : super(key: key);
  final List<PostComment> comments;
  final FocusNode myfocus;
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${comments.length} ${AppLocalizations.of(context)?.comments}',
            style:
                AppStyles.s13w400.copyWith(color: AppColors.iconButtonsNeutral),
          ),
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _OneComment(
                    comment: comments[index],
                    myfocus: myfocus,
                    textController: textController,
                  ),
                );
              },
              itemCount: comments.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _OneComment extends StatelessWidget {
  _OneComment({Key? key, required this.comment,required this.myfocus,required this.textController}) : super(key: key);
  final PostComment comment;
  final FocusNode myfocus;
  final TextEditingController textController;
  final formatter = DateFormatter();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () async {
              if(await ProfileRouter().checkProfile(comment.author.username)){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OwnProfileScreen()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(id: comment.author.id.toString())));
              }
            },
            child: CircleAvatar(
              backgroundImage:
              comment.author.avatar == null
                  ? AssetImage(AppAssets.images.testNews)
              as ImageProvider
                  : NetworkImage(
                'http://89.223.100.35:8080${comment.author.avatar?.dowloadUri}',
              ),
              backgroundColor: Colors.transparent,
            )),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.author.fullName),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    '${comment.comment}',
                    maxLines: null,
                  )),
              Row(
                children: [
                  Text(formatter.getProperDate(comment.createdAt, context),
                      style: AppStyles.s13w400.copyWith(
                        color: AppColors.iconButtonsNeutral,
                      )),
                  TextButton(
                      onPressed: () async {
                        await SharedPrefModel().setReply("true",comment.id.toString());
                        SharedPrefModel().isReply();
                        print('REPLYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');
                        print(SharedPrefModel().isReply());
                        textController.text = "${comment.author.fullName}, ";
                        myfocus.requestFocus();
                      },
                      child: Text(
                        '${AppLocalizations.of(context)?.reply}',
                        style: AppStyles.s14w400.copyWith(
                            color: AppColors.iconButtonsNeutral,
                            fontWeight: FontWeight.w700),
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
