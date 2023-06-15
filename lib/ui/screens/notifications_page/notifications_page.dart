import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_colors.dart';
import 'notifications_page_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NotificationsWidgetProvider(
        child: const _NotificationsWidgetBody());
  }
}

class _NotificationsWidgetBody extends StatefulWidget {
  const _NotificationsWidgetBody({Key? key}) : super(key: key);

  @override
  State<_NotificationsWidgetBody> createState() =>
      _NotificationsWidgetBodyState();
}

class _NotificationsWidgetBodyState extends State<_NotificationsWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
                child: Text(
                  "${AppLocalizations.of(context)?.notifications}",
                  style: GoogleFonts.poppins(textStyle: AppStyles.s24w700),
                )),
            SvgPicture.asset(AppAssets.svg.notificationsOptions),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _NewSection(),
        ],
      ),
    );
  }
}

class _NewSection extends StatefulWidget {
  const _NewSection({Key? key}) : super(key: key);

  @override
  State<_NewSection> createState() => _NewSectionState();
}

class _NewSectionState extends State<_NewSection> {
  final List<NotificationsWidgetModel> list = [
    NotificationsWidgetModel(
      date: [
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
      ],
      dateTime: DateTime.now(),
    ),
    NotificationsWidgetModel(
      date: [
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
      ],
      dateTime: DateTime.now(),
    ),
    NotificationsWidgetModel(
      date: [
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
        DateDetailed(
            name: 'BMW Liked your post Mercedes',
            icon: AppAssets.images.testProfile,
            secondTitle: '1 minutes ago'),
      ],
      dateTime: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(itemBuilder: (context, index1) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(list[index1].dateTime.toString(),style: GoogleFonts.poppins(textStyle: AppStyles.s16w400).copyWith(color: AppColors.mainBlack),)),
            ...List.generate(list[index1].date.length, (index) {
              final helper = list[index1].date[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  color: AppColors.mainWhite,
                  shadowColor: AppColors.mainBlack,
                  elevation: 7,
                  margin: const EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(helper.icon),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(helper.name, style: GoogleFonts.poppins(textStyle: AppStyles.s14w400).copyWith(color: AppColors.mainBlack),),
                              Text(helper.secondTitle,style: GoogleFonts.poppins(textStyle: AppStyles.s12w300).copyWith(color: AppColors.mainBlack),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
            ],
          );
        },
          itemCount: list.length,
        ),
      ),
    );
  }
}
