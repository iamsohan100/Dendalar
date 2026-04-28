import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final double? padding;
  final double? horPadding;
  final bool isPassword;
  final dynamic backgroundColor;
  final Widget? suffixIcon;
  final int? minLine;
  final int? maxLine;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool? isValidator;
  final bool? isPhone;
  final bool? isMail;
  final bool? isRequired;
  final Color? titleColor;

  final ValueChanged<String>? onChange;
  const CustomFormField({
    super.key,
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.backgroundColor,
    this.suffixIcon,
    this.minLine,
    this.maxLine,
    this.onTap,
    this.readOnly = false,
    this.prefixIcon,
    this.padding,
    this.onChange,
    this.initialValue,
    this.isValidator,
    this.isPhone,
    this.isMail,
    this.title,
    this.isRequired,
    this.horPadding,
    this.titleColor,
  });

  @override
  State<CustomFormField> createState() => _CustomFormField();
}

class _CustomFormField extends State<CustomFormField> {
  bool obSecure = true;

  @override
  Widget build(BuildContext context) {
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          CustomText(
            text: widget.title!,
            color: widget.titleColor ?? AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            isManjari: true,
          ),
          Sh(h: 0.01),
        ],

        TextFormField(
          keyboardType: widget.isPhone == true
              ? TextInputType.phone
              : widget.isMail == true
              ? TextInputType.emailAddress
              : null,
          initialValue: widget.initialValue,
          cursorColor: AppColors.primaryColor,
          onChanged: widget.onChange,
          onTap: widget.onTap,
          controller: widget.controller,
          readOnly: widget.readOnly,
          minLines: widget.minLine ?? 1,
          maxLines: widget.maxLine ?? 1,
          validator: widget.isValidator == false
              ? null
              : widget.isMail == true
              ? (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return '${widget.title} can not be empty';
                  } else if (RegExp(
                    r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.(com|net|org)$',
                  ).hasMatch(value!)) {
                    return null;
                  }
                  return "Please enter valid e-mail";
                }
              : (value) {
                  if (value!.isEmpty) {
                    return '${widget.title} can not be empty';
                  }
                  return null;
                },
          style: GoogleFonts.manjari(
            fontSize: scaleFactor * 14,
            fontWeight: FontWeight.w400,
            color: AppColors.blackout,
          ),

          obscureText: widget.isPassword && obSecure,
          decoration: InputDecoration(
            filled: true,
            fillColor: (widget.backgroundColor == null)
                ? AppColors.white
                : widget.backgroundColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: widget.padding ?? 0,
              horizontal: widget.horPadding ?? scaleFactor * 20,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obSecure = !obSecure;
                      });
                    },
                    child: Icon(
                      (widget.isPassword && obSecure)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: scaleFactor * 20,
                      color: AppColors.darkGreyishBrown,
                    ),
                  )
                : widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.manjari(
              fontSize: scaleFactor * 14,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGreyishBrown,
            ),

            errorStyle: GoogleFonts.inter(
              fontSize: scaleFactor * 14,
              fontWeight: FontWeight.w400,
              color: AppColors.red,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(scaleFactor * 10),
              borderSide: BorderSide(color: AppColors.grayHint, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(scaleFactor * 10),
              borderSide: BorderSide(color: AppColors.grayHint, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(scaleFactor * 10),
              borderSide: BorderSide(color: AppColors.grayHint, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(scaleFactor * 10),
              borderSide: BorderSide(color: AppColors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(scaleFactor * 10),
              borderSide: BorderSide(color: AppColors.red, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
