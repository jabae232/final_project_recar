import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../date_formatter/date_formatter.dart';
import '../../own_profile/widgets/posts/ui/post_widget.dart';
import '../../profile/widgets/comment_section/ui/comment_section.dart';
import '../../profile/widgets/post/data/post_profile_bloc.dart';
import '../data/dto/all_posts_dto.dart';
class _NewsLetterWidgetSample extends StatefulWidget {

  const _NewsLetterWidgetSample({Key? key,required this.post})
      : super(key: key);
  final AllPostsDto post;
  @override
  State<_NewsLetterWidgetSample> createState() => _NewsLetterWidgetSampleState();
}

class _NewsLetterWidgetSampleState extends State<_NewsLetterWidgetSample> {
  @override
  Widget build(BuildContext context) {
    return _PostListRowWidgets(post: widget.post,);
  }
}

class Profile extends StatelessWidget {
  final String icon;
  final String nickName;
  final String date;
  const Profile(
      {Key? key,
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

class NewsLetterWidget extends StatelessWidget {

  const NewsLetterWidget({Key? key,required this.list}) : super(key: key);
  final List<AllPostsDto>? list;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _NewsLetterWidgetSample(
            post: list![index],
          );
        },
        itemCount: list!.length,
        shrinkWrap: true,
      ),
    );
  }
}

class _PostListRowWidgets extends StatelessWidget {
  const _PostListRowWidgets({Key? key, required this.post})
      : super(key: key);
  final AllPostsDto post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhite,
            border: Border.all(color: Colors.black.withOpacity(0.01)),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      post.author.avatar == null
                          ? AssetImage(AppAssets.images.testNews)
                      as ImageProvider
                          : NetworkImage(
                        'http://89.223.100.35:8080${post.author.avatar?.dowloadUri}',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '@${post.author.username}',
                          style: AppStyles.s18w700.copyWith(
                              color: AppColors.mainBlack,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        Text(
                          DateFormatter().getProperDate(
                              post.createdAt,
                              context),
                          style:
                          AppStyles.s16w400.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('${post.description}')),
                post.postMedia.isNotEmpty ?
                Image.network(
                  'http://89.223.100.35:8080${post.postMedia.first.mediaFile}',
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const CircularProgressIndicator();
                  },
                ) : SizedBox.shrink(),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<PostProfileBloc>(context)..add(SavePostsProfileEvent(id: post.id.toString()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.blueNeutral,
                          border:
                          Border.all(color: Colors.black.withOpacity(0.01)),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: SvgPicture.asset(AppAssets.svg.likesNews,
                                    color: AppColors.iconButtonsNeutral)),
                            const Text(
                              '0',
                              style: TextStyle(
                                  color: AppColors.iconButtonsNeutral),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CommentSectionProfileWidget(id: post.id)));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.blueNeutral,
                          border:
                          Border.all(color: Colors.black.withOpacity(0.01)),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.svg.commentNews,
                          color: AppColors.iconButtonsNeutral,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.blueNeutral,
                          border:
                          Border.all(color: Colors.black.withOpacity(0.01)),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: SvgPicture.asset(
                                  AppAssets.svg.shareNews,
                                  color: AppColors.iconButtonsNeutral,
                                )),
                            const Text('0',
                                style: TextStyle(
                                    color: AppColors.iconButtonsNeutral)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
