import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/screens/newsletter_screen/ui/widgets/recent_news_list_widget/ui/recent_news_list_widget.dart';
import 'package:car_m/ui/screens/newsletter_screen/ui/widgets/recent_news_list_widget/ui/widgets/single_news_widget.dart';
import 'package:car_m/ui/screens/newsletter_screen/ui/widgets/search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/app_colors.dart';

class NewsletterScreen extends StatefulWidget {
  const NewsletterScreen({Key? key}) : super(key: key);

  @override
  State<NewsletterScreen> createState() => _NewsletterScreenState();
}

class _NewsletterScreenState extends State<NewsletterScreen> {
  @override
  Widget build(BuildContext context) {
    return _NewsletterScreenBody();
  }
}

class _NewsletterScreenBody extends StatelessWidget {
  const _NewsletterScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                '${AppLocalizations.of(context)?.news}',
                style: AppStyles.s24w700.copyWith(color: AppColors.mainBlack),
              ),
              backgroundColor: AppColors.background,
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                  child: SearchContainer()),
              Flexible(
                flex: 3,
                  child: SingleNewsLetterWidget(announcement: '', authorName: '', date: '',)),
            ],
          ),
        ),
      ),
    );
  }
}
