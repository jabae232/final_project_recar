import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.mainBlack,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
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
            style: AppStyles.s18w700,
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Mercedes',
                        hintStyle: AppStyles.s16w400.copyWith(color: AppColors.searchHintText),
                        fillColor: AppColors.background,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.mainBlack,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        )),
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
    );
  }
}
