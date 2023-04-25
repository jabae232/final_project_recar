

import 'package:car_m/ui/screens/search_page/widgets/profile/others_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';

class TabBarForSearch extends StatefulWidget {
  const TabBarForSearch({Key? key}) : super(key: key);

  @override
  State<TabBarForSearch> createState() => _TabBarForSearchState();
}

class _TabBarForSearchState extends State<TabBarForSearch> with TickerProviderStateMixin{
  final style = GoogleFonts.poppins(textStyle: AppStyles.s13w400).copyWith(color: AppColors.mainBlack);
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4,vsync: this);
    return Column(children:  [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 5),
        child: Row(
          children: [
            SizedBox(
              width: 317,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  padding: EdgeInsets.zero,
                  indicatorColor: AppColors.mainBlack,
                  controller: tabController,
                  tabs: [
                    Tab(
                      child: Text("${AppLocalizations.of(context)?.all}",style: style,),
                    ),
                    FittedBox(
                      child: Tab(
                        child: Text("${AppLocalizations.of(context)?.profiles}",style: style,),
                      ),
                    ),
                    Tab(
                      child: Text("${AppLocalizations.of(context)?.posts}",style: style,),
                    ),
                    FittedBox(
                      child: Tab(
                        child: Text("${AppLocalizations.of(context)?.videos}",style: style,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox(width: 1,)),
          ],
        ),
      ),
      Expanded(
        child: Container(
          child: TabBarView(
            controller: tabController,
            children: const [
              Tab(
                child: Text(''),
              ),
              Tab(
                child: OthersProfileWidget(),
              ),
              Tab(
                child: Text(''),
              ),
              Tab(
                child: Text(''),
              ),
            ],
          ),
        ),
      )]);
  }
}
