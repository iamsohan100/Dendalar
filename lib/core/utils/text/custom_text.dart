import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double? letterSpacing;
  final dynamic textAlign;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextOverflow? textOverflow;
  final double? lineHeight;
  final bool? isManjari;
  final bool? isKoulen;
  final bool? isManrope;

  const CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.textAlign,
    this.maxLine,
    this.textDecoration,
    this.textDecorationColor,
    this.textOverflow,
    this.letterSpacing,
    this.lineHeight,
    this.isKoulen,
    this.isManrope,
    this.isManjari,
  });

  @override
  Widget build(BuildContext context) {
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Text(
      text,
      maxLines: maxLine,
      overflow: textOverflow ?? TextOverflow.clip,
      textAlign: (textAlign == null) ? TextAlign.start : textAlign,
      style: isManjari == true
          ? GoogleFonts.manjari(
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationThickness: 1,
              fontSize: scaleFactor * fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing ?? 0,
              height: lineHeight,
            )
          : isKoulen == true
          ? GoogleFonts.koulen(
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationThickness: 1,
              fontSize: scaleFactor * fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing ?? 0,
              height: lineHeight,
            )
          : isManrope == true
          ? GoogleFonts.manrope(
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationThickness: 1,
              fontSize: scaleFactor * fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing ?? 0,
              height: lineHeight,
            )
          : GoogleFonts.inter(
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationThickness: 1,
              fontSize: scaleFactor * fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing ?? 0,
              height: lineHeight,
            ),
    );
  }
}
