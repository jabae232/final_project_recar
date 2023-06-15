import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/navigation/main_navigation.dart';
import 'package:car_m/ui/screens/news_page/widgets/news_letters_widget.dart';
import 'package:car_m/ui/screens/news_page/widgets/story_widget.dart';
import 'package:car_m/ui/screens/news_page/widgets/toggle_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_assets.dart';
import '../../notifications_page/notifications_page.dart';
import '../data/bloc/news_page_bloc.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return _NewsWidgetBody();
  }
}

Future refresh() async {}

class _NewsWidgetBody extends StatelessWidget {
  const _NewsWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void push() {
      Navigator.push(context, MainNavigationPush().ownProfile);
    }

    return Scaffold(
        backgroundColor: AppColors.background,
        body: BlocBuilder<NewsPageBloc, NewsPageState>(
          builder: (context, state) {
            if(state is NewsPageLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is NewsPageLoaded) {
              return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                            backgroundColor: Colors.black12,
                            radius: 46,
                            child: InkWell(
                              onTap: push,
                              child: const CircleAvatar(
                                radius: 44,
                                backgroundColor: AppColors.regWhite,
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  color: Colors.blueGrey,
                                  size: 34,
                                ),
                              ),
                            )),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                              child: Text(
                                "${AppLocalizations
                                    .of(context)
                                    ?.home}",
                                style: AppStyles.s21w500
                                    .copyWith(color: AppColors.mainBlack),
                              )),
                          GestureDetector(
                              onTap: () =>
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationsWidget())),
                              child:
                              SvgPicture.asset(AppAssets.svg.notifications)),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.settings,
                                color: AppColors.mainBlack,
                              )),
                        ],
                      ),
                      backgroundColor: AppColors.mainWhite,
                      pinned: false,
                      snap: true,
                      floating: true,
                      elevation: 2,
                    ),
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Stories(),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(child: NewsLetterWidget(list: state.posts,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } if(state is NewsPageError) {
              return const Center(child: Text('Something went wrong'),);
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
