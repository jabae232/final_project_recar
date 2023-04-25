import 'package:car_m/ui/screens/news_page/widgets/check_story_widget/check_story_widget_model.dart';
import 'package:car_m/ui/screens/news_page/widgets/check_story_widget/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../news_letters_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckStoryWidget extends StatefulWidget {
  CheckStoryWidget({Key? key,}) : super(key: key);
  final TopNewStories testNewStory = TopNewStories(author: 'BMW', time: '1 day ago', avatar: AppAssets.images.testProfile);
  @override
  State<CheckStoryWidget> createState() => _CheckStoryWidgetState();
}

class _CheckStoryWidgetState extends State<CheckStoryWidget> {
  final model = CheckStoryWidgetModel();
  @override
  Widget build(BuildContext context) {
    return CheckStoryWidgetModelProvider(
        model: model, child: _CheckStoryWidgetBody(story: widget.testNewStory,));
  }
}

class _CheckStoryWidgetBody extends StatelessWidget {
  const _CheckStoryWidgetBody({Key? key,required this.story}) : super(key: key);
  final TopNewStories story;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.checkStoryMainBlack,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Row(
            children: [
              Expanded(child: TextField(
                style: const TextStyle(color: AppColors.mainWhite),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                  hintText: '${AppLocalizations.of(context)?.typeSomeText}',
                  hintStyle: const TextStyle(color: AppColors.mainWhite),
                  enabledBorder:  const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(
                      color: AppColors.mainWhite,
                    )
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.mainWhite,
                      )
                  ),
                ),
              )),
              const SizedBox(width: 20,),
              SvgPicture.asset(AppAssets.svg.postComment),
            ],
          ),
        ),
      ),
      body:Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.01)),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(55),topRight: Radius.circular(55)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 15,
              offset: const Offset(0, 7),
            ),
          ],
          image: DecorationImage(
              image: AssetImage(AppAssets.images.testBackGroundProfile),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 30.2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Profile(
                icon: story.avatar,
                nickName: story.author,
                date: story.time,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              SvgPicture.asset(AppAssets.svg.moreVertical),
              const SizedBox(width: 20,),
              InkWell(
                onTap: () => Navigator.pop(context),
                  onLongPress: () => Navigator.pop(context),
                  child: SvgPicture.asset(AppAssets.svg.quit)),
            ],
          ),
        ),
      ),
    );
  }
}
