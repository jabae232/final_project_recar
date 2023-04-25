/*
import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/ui/screens/profile/profile.dart';
import 'package:car_m/ui/screens/profile/widgets/all_posts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';


class TestWidget extends StatelessWidget {
   TestWidget({super.key});
  final parametr = ProfileParameters(
      backgroundImage: AppAssets.images.testBackGroundProfile,
      avatarImage: AppAssets.images.testStories,
      nametag: '@mercedes',
      fullName: 'Mercedes Benz',
      followers: '225',
      followings: '225',
      clubs: '125');
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: SliverAppBarExample(parameters: parametr,),
    );
  }
}

class SliverAppBarExample extends StatefulWidget {
  final ProfileParameters parameters;
  const SliverAppBarExample({super.key, required this.parameters});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> with SingleTickerProviderStateMixin {
 late TabController tabController;
 @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.poppins(textStyle: AppStyles.s13w400).copyWith(color: AppColors.mainBlack);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: const Icon(Icons.chevron_left_outlined),
              backgroundColor: Colors.black,
              pinned: true,
              snap: false,
              floating: false,
              title: Text(widget.parameters.nametag),
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.asset(AppAssets.images.testBackGroundProfile,fit: BoxFit.fitWidth,),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                  child: Stack(
                      clipBehavior: Clip.none,
                      children: [Container(
                        padding: const EdgeInsets.all(24),
                        color: AppColors.mainBlack,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(radius: 46,
                                  backgroundImage: AssetImage(widget.parameters.avatarImage),),
                                const SizedBox(
                                  width: 24,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.parameters.fullName,
                                      style: GoogleFonts.inter(textStyle: AppStyles.s24w700)
                                          .copyWith(color: AppColors.mainWhite),
                                    ),
                                    Text(
                                      widget.parameters.nametag,
                                      style: GoogleFonts.inter(textStyle: AppStyles.s16w400)
                                          .copyWith(color: AppColors.mainWhite),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(widget.parameters.followers,
                                            style: GoogleFonts.inter(textStyle: AppStyles.s24w700)
                                                .copyWith(color: AppColors.mainWhite)),
                                        Text('Followers',style: GoogleFonts.inter(textStyle: AppStyles.s16w400).copyWith(color: AppColors.mainWhite)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(widget.parameters.followings,style: GoogleFonts.inter(textStyle: AppStyles.s24w700).copyWith(color: AppColors.mainWhite),),
                                        Text('Followings',style: GoogleFonts.inter(textStyle: AppStyles.s16w400).copyWith(color: AppColors.mainWhite)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(widget.parameters.clubs,style: GoogleFonts.inter(textStyle: AppStyles.s24w700).copyWith(color: AppColors.mainWhite)
                                        ),
                                        Text('Clubs',style: GoogleFonts.inter(textStyle: AppStyles.s16w400).copyWith(color: AppColors.mainWhite)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 121,
                                    child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        )
                                    ), child: Text('Follow',style: GoogleFonts.poppins(textStyle: AppStyles.s14w500),),),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: SizedBox(
                                    width: 121,
                                    child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.mainWhite,
                                        foregroundColor: AppColors.mainBlack,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        )
                                    ), child: Text('Message',style: GoogleFonts.poppins(textStyle: AppStyles.s14w500),)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      ]
                  )
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: TabBar(
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
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    PostsWidget(),
                    Text('3'),
                    Text('3'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
