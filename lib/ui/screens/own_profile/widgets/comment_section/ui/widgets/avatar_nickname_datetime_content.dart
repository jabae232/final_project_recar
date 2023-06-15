import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../constants/app_assets.dart';
import '../../../../../../../constants/app_colors.dart';
import '../../../../../../../date_formatter/date_formatter.dart';
import '../../../../../../navigation/profile_router.dart';
import '../../../../../profile/ui/profile_screen.dart';
import '../../../../ui/own_profile_screen.dart';

class PostHeader extends StatelessWidget {
  const PostHeader(
      {Key? key,
      required this.id,
      required this.nickname,
      required this.username,
      required this.datetime,
      required this.content,
      required this.avatar,
      required this.contentImage})
      : super(key: key);
  final String nickname;
  final String username;
  final DateTime datetime;
  final String content;
  final String id;
  final String avatar;
  final String contentImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              if (await ProfileRouter().checkProfile(nickname)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OwnProfileScreen()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(id: id)));
              }
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                  avatar.isEmpty
                      ? AssetImage(AppAssets.images.testNews)
                  as ImageProvider
                      : NetworkImage(
                    avatar
                  ),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username),
                    Text(
                      DateFormatter().getProperDate(datetime, context),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              content,
              maxLines: null,
            ),
          ),
          contentImage.isNotEmpty ?
          Image.network(
            contentImage,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const CircularProgressIndicator();
            },
          ) : SizedBox.shrink(), // photos
          Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Container(
                height: 1,
                color: Colors.grey,
              )),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.blueNeutral,
                    border: Border.all(color: Colors.black.withOpacity(0.01)),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SvgPicture.asset(AppAssets.svg.likesNews,
                              color: AppColors.iconButtonsNeutral)),
                      const Text(
                        '0',
                        style: TextStyle(color: AppColors.iconButtonsNeutral),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.blueNeutral,
                  border: Border.all(color: Colors.black.withOpacity(0.01)),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SvgPicture.asset(
                      AppAssets.svg.shareNewsProper,
                      color: AppColors.iconButtonsNeutral,
                      width: 24,
                      height: 24,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
