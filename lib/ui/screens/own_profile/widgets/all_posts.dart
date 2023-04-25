import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';

class _PostsWidgetSample extends StatelessWidget {
  final Parameters parameters;

  const _PostsWidgetSample({Key? key, required this.parameters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 384,
        width: 386,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.01)),
          borderRadius: const BorderRadius.all(Radius.circular(36)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 15,
              offset: const Offset(0, 7),
            ),
          ],
          image: DecorationImage(
              image: AssetImage(AppAssets.images.testStories),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19.2, horizontal: 23.2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Profile(
                icon: parameters.image,
                nickName: parameters.nickName,
                date: parameters.time,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Column(
                children: [
                  SvgPicture.asset(AppAssets.svg.favouriteNews),
                  const SizedBox(
                    height: 100,
                  ),
                  SvgPicture.asset(AppAssets.svg.shareNews),
                  const SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset(AppAssets.svg.likesNews),
                  Text(
                    parameters.likes,
                    style: GoogleFonts.poppins(textStyle: AppStyles.s14w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset(AppAssets.svg.commentNews),
                  Text(
                    parameters.comments,
                    style: GoogleFonts.poppins(textStyle: AppStyles.s14w400),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  class Parameters {
  final String image;
  final String likes;
  final String comments;
  final String post;
  final String nickName;
  final String time;
  Parameters({
  required this.image,
  required this.likes,
  required this.comments,
  required this.post,
  required this.time,
  required this.nickName,
  });
  }
class OwnPostsWidget extends StatelessWidget {
  const OwnPostsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final list = [
      Parameters(
          image: AppAssets.images.testStories,
          likes: '2.5k',
          comments: '103',
          post: AppAssets.images.testStories,
          time: '1 ${AppLocalizations.of(context)?.dayAgo}',
          nickName: 'Mercedes'),
      Parameters(
          image: AppAssets.images.testStories,
          likes: '2.5k',
          comments: '103',
          post: AppAssets.images.testStories,
          time: '1 ${AppLocalizations.of(context)?.dayAgo}',
          nickName: 'Mercedes'),
    ];
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _PostsWidgetSample(
            parameters: list[index],
          );
        },
        itemCount: list.length,
        shrinkWrap: true,
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String icon;
  final String nickName;
  final String date;

  const Profile({Key? key,
    required this.icon,
    required this.nickName,
    required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage(AppAssets.images.testProfile),
        ),
        const SizedBox(
          width: 9,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nickName,
              style: GoogleFonts.poppins(textStyle: AppStyles.s14w500)
                  .copyWith(color: AppColors.mainWhite),
            ),
            Text(
              date,
              style: GoogleFonts.poppins(textStyle: AppStyles.s12w300)
                  .copyWith(color: AppColors.mainWhite),
            )
          ],
        )
      ],
    );
  }
}
