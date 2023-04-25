

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import 'all_posts.dart';

class TabBarForProfile extends StatefulWidget {
  const TabBarForProfile({Key? key}) : super(key: key);

  @override
  State<TabBarForProfile> createState() => _TabBarForProfileState();
}

class _TabBarForProfileState extends State<TabBarForProfile> with TickerProviderStateMixin{
  final style = GoogleFonts.poppins(textStyle: AppStyles.s13w400).copyWith(color: AppColors.mainBlack);
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3,vsync: this);
    return Column(children:  [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 5),
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            Container(
              width: 300,
              child: Align(
                alignment: Alignment.center,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: AppColors.mainBlack,
                  indicatorWeight: 3,

                  controller: tabController,
                  tabs: [
                    Tab(
                      child: Text('All',style: style,),
                    ),
                    Tab(
                      child: Text('Posts',style: style,),
                    ),
                    Tab(
                      child: Text('Videos',style: style,),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
            controller: tabController,
            children: const [
              PostsWidget(),
              Tab(
                child: Text('2'),
              ),
              Tab(
                child: Text('3'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
