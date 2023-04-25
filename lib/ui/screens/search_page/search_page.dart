import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/ui/screens/profile/profile_model.dart';
import 'package:car_m/ui/screens/search_page/search_page_model.dart';
import 'package:car_m/ui/screens/search_page/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../constants/app_styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = SearchWidgetModel();
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SearchWidgetProvider(
            model: model, child: const _SearchWidgetBody()));
  }
}

class _SearchWidgetBody extends StatelessWidget {
  const _SearchWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _SearchWidget(),
        Expanded(child: TabBarForSearch()),
      ],
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.mainBlack,
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 6,
                    offset: const Offset(0, 10),
                  )
                ]),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppLocalizations.of(context)?.search}",
                  style: GoogleFonts.poppins(textStyle: AppStyles.s18w700),
                ),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                          hintText: 'Mercedes',
                          hintStyle: GoogleFonts.poppins(textStyle: AppStyles.s16w400.copyWith(color: AppColors.searchHintText)),
                          fillColor: AppColors.background,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.mainBlack,
                            ),
                            borderRadius: BorderRadius.circular(60),
                          )
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(AppAssets.svg.filter,
                        color: AppColors.mainWhite),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      AppAssets.svg.search,
                      color: AppColors.mainWhite,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
