import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class _NewsLetterWidgetSample extends StatefulWidget {
  final Parameters parameters;
  const _NewsLetterWidgetSample({Key? key, required this.parameters})
      : super(key: key);

  @override
  State<_NewsLetterWidgetSample> createState() => _NewsLetterWidgetSampleState();
}

class _NewsLetterWidgetSampleState extends State<_NewsLetterWidgetSample> {
  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;
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
          borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                icon: widget.parameters.image,
                nickName: widget.parameters.nickName,
                date: widget.parameters.time,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Column(
                children: [
                  InkWell(child: SvgPicture.asset(AppAssets.svg.favouriteNews, color: a? Colors.red : Colors.white,),onTap: (){
                    a = !a;
                    setState(() {
                    });
                  }),
                  const SizedBox(
                    height: 100,
                  ),
                  InkWell(child: SvgPicture.asset(AppAssets.svg.shareNews),onTap: (){}),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(child: SvgPicture.asset(AppAssets.svg.likesNews,color: b? Colors.red.shade900 : Colors.white,),
                  onTap: (){
                    b = !b;
                    setState(() {
                    });
                  },),
                  Text(
                    widget.parameters.likes,
                    style: GoogleFonts.poppins(textStyle: AppStyles.s14w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(child: SvgPicture.asset(AppAssets.svg.commentNews),onTap: (){}),
                  Text(
                    widget.parameters.comments,
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
  const NewsLetterWidget({Key? key}) : super(key: key);
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
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _NewsLetterWidgetSample(
            parameters: list[index],
          );
        },
        itemCount: list.length,
        shrinkWrap: true,
      ),
    );
  }
}
