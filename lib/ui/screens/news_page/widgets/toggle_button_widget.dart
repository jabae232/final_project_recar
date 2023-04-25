import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key}) : super(key: key);
  @override
   _ToggleButtonState createState() => _ToggleButtonState();
}


class _ToggleButtonState extends State<ToggleButton> {
  double? xAlign;
  Color? loginColor;
  Color? signInColor;
  static const double width = 400.0;
  static double height = 60.0;
  static double loginAlign = -1;
  static double signInAlign = 1;
  static Color selectedColor = Colors.white;
  static Color normalColor = Colors.black54;
  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.mainBlack,
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 6,
          offset: const Offset(0, 8),
        ),]
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign ?? 0, 0),
            duration: const Duration(milliseconds: 110),
            child: Container(
              width: width * 0.5,
              height: height,
              decoration: const BoxDecoration(
                color: AppColors.activeStoryIcon,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = loginAlign;
                loginColor = selectedColor;
                signInColor = normalColor;
              });
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  "${AppLocalizations.of(context)?.recommended}",
                  style: GoogleFonts.poppins(textStyle: AppStyles.s14w400.copyWith(color: AppColors.mainWhite,fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = signInAlign;
                signInColor = selectedColor;
                loginColor = normalColor;
              });
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  "${AppLocalizations.of(context)?.followings}",
                  style: GoogleFonts.poppins(textStyle: AppStyles.s14w400.copyWith(color: AppColors.mainWhite,fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}