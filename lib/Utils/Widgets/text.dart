import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Alignment? alignment;
  final Shader? shader;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 14,
    this.fontWeight,
    this.textAlign,
    this.shader,
    this.alignment,
    this.decoration,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize.sp,
          color:
              shader == null ? color ?? ColorConstants.primaryTextColor : null,
          foreground: shader != null ? (Paint()..shader = shader!) : null,
          decoration: decoration),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
