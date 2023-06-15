import 'package:car_m/ui/screens/newsletter_screen/ui/widgets/recent_news_list_widget/ui/widgets/single_news_widget.dart';
import 'package:flutter/material.dart';

class RecentNewsListWidget extends StatefulWidget {
  const RecentNewsListWidget({Key? key}) : super(key: key);

  @override
  State<RecentNewsListWidget> createState() => _RecentNewsListWidgetState();
}

class _RecentNewsListWidgetState extends State<RecentNewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SingleNewsLetterWidget(
          announcement: 'Mercedes announced a new car',
          authorName: 'Sang Dong-in',
          date: 'Sep 9, 2022',
        );
      },
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
    );
  }
}
