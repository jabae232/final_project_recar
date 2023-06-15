import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/screens/club_screen/ui/widgets/club_welcome_screen/widgets/gallery_club_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../constants/app_assets.dart';

class ClubWelcomeScreen extends StatefulWidget {
  const ClubWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<ClubWelcomeScreen> createState() => _ClubWelcomeScreenState();
}

class _ClubWelcomeScreenState extends State<ClubWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const _ClubScreenBody();
  }
}

class _ClubScreenBody extends StatefulWidget {
  const _ClubScreenBody({Key? key}) : super(key: key);

  @override
  State<_ClubScreenBody> createState() => _ClubScreenBodyState();
}

class _ClubScreenBodyState extends State<_ClubScreenBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((_) {
      showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.transparent,
          builder: (_) {
            return DraggableScrollableSheet(
              initialChildSize: 0.65,
              builder: (_,controller) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.mainWhite,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Porsche Club',
                          style: AppStyles.s14w500
                              .copyWith(fontSize: 32, color: AppColors.mainBlack),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.messageBackgroundUser,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {},
                                child: FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppAssets.svg.subscribe),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                          '${AppLocalizations.of(context)?.subscribe}',
                                          style: AppStyles.w400poppins.copyWith(
                                              color: AppColors.mainWhite)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.messageBackgroundUser,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {},
                                child: FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppAssets.svg.suggestPost),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                          '${AppLocalizations.of(context)?.suggestPost}',
                                          style: AppStyles.w400poppins.copyWith(color: AppColors.mainWhite),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21.0,vertical: 24.0),
                        child: Text(maxLines:null,style:AppStyles.s14w500.copyWith(color: AppColors.messages),
                            "Just say anything, George, say what ever iss natural, the first thing that comes to your mind. Take that you mutated son-of-a-bitch. My pine, why you. You space bastard, you killed a pine. You do? Yeah, it is 8:00. Hey, McFly, I thought I told you never "),
                      ),
                      Expanded(child: GalleryClubWidget(controller: controller,)),
                    ],
                  ),
                ),
              ),
            );
          }).whenComplete(() => Navigator.pop(context));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 400,
                    stretch: false,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SvgPicture.asset(AppAssets.svg.classyBackBtn),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Image.asset(
                        AppAssets.images.porcheClub,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ];
              },
              body: const SizedBox.shrink()),
        ],
      ),
    );
  }
}
