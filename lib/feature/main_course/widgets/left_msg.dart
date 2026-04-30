import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeftMessage extends StatelessWidget {
  const LeftMessage({
    super.key,
    required this.msg,
    this.filledWords = const [],
    this.isCorrectList = const [], // Added validation list
  });
  final String msg;
  final List<String> filledWords;
  final List<bool> isCorrectList; // Added validation list

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.onboardingPage1,
            width: scaleFactor * 60,
            fit: BoxFit.contain,
          ),

          Sw(w: 0.035),
          Align(
            alignment: Alignment.centerRight,

            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: -10,
                  child: Image.asset(
                    AppIcons.triangle2,
                    scale: 4,
                    color: AppColors.sweetGrey,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleFactor * 14,
                    vertical: scaleFactor * 14,
                  ),
                  constraints: BoxConstraints(
                    minWidth: width * 0.3,
                    maxWidth: width * 0.65,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grayHint),
                    borderRadius: BorderRadius.circular(scaleFactor * 12),
                  ),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: _buildTextSpans(msg, filledWords, isCorrectList, scaleFactor),
                      style: GoogleFonts.inter(
                        fontSize: scaleFactor * 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _buildTextSpans(
    String text,
    List<String> words,
    List<bool> isCorrectList,
    double scaleFactor,
  ) {
    List<TextSpan> spans = [];
    final parts = text.split(RegExp(r'_{2,}'));

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i]));

      if (i < parts.length - 1) {
        bool isFilled = i < words.length;
        String blankText = isFilled ? words[i] : "__________";
        
        // Determine color based on correctness
        Color textColor = AppColors.grayHint;
        if (isFilled) {
          bool isCorrect = i < isCorrectList.length ? isCorrectList[i] : true;
          textColor = isCorrect ? AppColors.muslimGreen : AppColors.red;
        }

        spans.add(
          TextSpan(
            text: blankText,
            style: TextStyle(
              color: textColor,
              fontWeight: isFilled ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        );
      }
    }
    return spans;
  }
}
