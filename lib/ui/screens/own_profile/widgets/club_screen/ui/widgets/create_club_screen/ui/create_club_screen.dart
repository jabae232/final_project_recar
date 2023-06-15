import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/screens/own_profile/widgets/club_screen/ui/widgets/create_club_screen/ui/widgets/club_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../../constants/app_colors.dart';

class CreateClubScreen extends StatefulWidget {
  const CreateClubScreen({Key? key}) : super(key: key);

  @override
  State<CreateClubScreen> createState() => _CreateClubScreenState();
}

class _CreateClubScreenState extends State<CreateClubScreen> {
  @override
  Widget build(BuildContext context) {
    return const _CreateClubScreenBody();
  }
}

class _CreateClubScreenBody extends StatelessWidget {
  const _CreateClubScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.background,
              elevation: 0,
              leading: const BackButton(
                color: Colors.blue,
              ),
              title: Text(
                '${AppLocalizations.of(context)?.clubCreation}',
                style: AppStyles.s24w700.copyWith(color: AppColors.mainBlack),
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '${AppLocalizations.of(context)?.clubCreationDescription}',
                  style: AppStyles.s16w400.copyWith(color: AppColors.mainBlack),
                  maxLines: null,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClubNameScreen()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(AppAssets.images.news))),
                      Expanded(
                          child: Container(
                              child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)?.newsClub}',
                              style: AppStyles.s18w700.copyWith(
                                  color: AppColors.mainBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${AppLocalizations.of(context)?.newsClubDescription}',
                              style: AppStyles.s12w300
                                  .copyWith(color: AppColors.mainBlack),
                            )
                          ],
                        ),
                      ))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClubNameScreen()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                AppAssets.images.autoclub,
                                fit: BoxFit.fill,
                              ))),
                      Expanded(
                          child: Container(
                              child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)?.clubVehicle}',
                              style: AppStyles.s18w700.copyWith(
                                  color: AppColors.mainBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${AppLocalizations.of(context)?.clubVehicleDescription}',
                              style: AppStyles.s12w300
                                  .copyWith(color: AppColors.mainBlack),
                            )
                          ],
                        ),
                      ))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClubNameScreen()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(AppAssets.images.bikeclub))),
                      Expanded(
                          child: Container(
                              child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)?.clubMotorcycle}',
                              style: AppStyles.s18w700.copyWith(
                                  color: AppColors.mainBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${AppLocalizations.of(context)?.clubMotorcycleDescription}',
                              style: AppStyles.s12w300
                                  .copyWith(color: AppColors.mainBlack),
                            )
                          ],
                        ),
                      ))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClubNameScreen()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(AppAssets.images.brandclub))),
                      Expanded(
                          child: Container(
                              child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)?.clubBrand}',
                              style: AppStyles.s18w700.copyWith(
                                  color: AppColors.mainBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${AppLocalizations.of(context)?.clubBrandDescription}',
                              style: AppStyles.s12w300
                                  .copyWith(color: AppColors.mainBlack),
                            )
                          ],
                        ),
                      ))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
