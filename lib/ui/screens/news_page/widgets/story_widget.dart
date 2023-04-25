import 'package:car_m/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../navigation/main_navigation.dart';
import 'create_story_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final helper = BoxShadow(
      color: Colors.black.withOpacity(1),
      blurRadius: 6,
      offset: const Offset(0, 8),
    );
    return InkWell(
      onTap: () => Navigator.push(context, MainNavigationPush().stories),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.mainBlack,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [helper]),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    "${AppLocalizations.of(context)?.stories}",
                    style: GoogleFonts.poppins(textStyle: AppStyles.s18w700),
                  ),
                ),
                SvgPicture.asset(
                  AppAssets.svg.notificationsOptions,
                  color: AppColors.mainWhite,
                  height: 22,
                  width: 22,
                ),
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  AppAssets.svg.messages,
                  height: 22,
                  width: 22,
                ),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      CreateStoryWidget(),
                      StoryWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class StoryWidget extends StatefulWidget {
  const StoryWidget({Key? key}) : super(key: key);

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}
class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    final stories = [
      Story(
        isSeen: false,
        author: 'BMW',
        image: AssetImage(AppAssets.images.testStories),
      ),
      Story(
        isSeen: false,
        author: 'BMW',
        image: AssetImage(AppAssets.images.testStories),
      ),
      Story(
        isSeen: true,
        author: 'BMW',
        image: AssetImage(AppAssets.images.testStories),
      ),
      Story(
        isSeen: false,
        author: 'BMW',
        image: AssetImage(AppAssets.images.testStories),
      ),
      Story(
        isSeen: false,
        author: 'BMW',
        image: AssetImage(AppAssets.images.testStories),
      ),
    ];
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _StoryWidgetSample(story: stories[index]);
        },
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }
}
class _StoryWidgetSample extends StatelessWidget {
  final Story story;
  const _StoryWidgetSample({Key? key, required this.story}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.svg.rect64,
                color: story.isSeen
                    ? AppColors.neutralStoryIcon
                    : AppColors.activeStoryIcon,
              ),
              SvgPicture.asset(AppAssets.svg.rect48,
                  color: AppColors.mainWhite),
              Container(
                clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 50,
                  child: Image(image: AssetImage(AppAssets.images.testStories),)),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            story.author,
            style: GoogleFonts.poppins(
                textStyle:
                    AppStyles.s16w400.copyWith(color: AppColors.mainWhite)),
          ),
        ],
      ),
    );
  }
}
class Story {
  final bool isSeen;
  final AssetImage image;
  final String author;
  Story({required this.isSeen, required this.image, required this.author});
}
