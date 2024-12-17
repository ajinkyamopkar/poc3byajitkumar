import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;

  final void Function()? onTap;
  final TextStyle? text1Style;
  final TextStyle? text2Style;
  final TextStyle? text3Style;
  final TextStyle? text4Style;
  final TextDecoration? decoration;

  const CustomRichText({
    super.key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.onTap,
    this.text1Style,
    this.text2Style,
    this.text3Style,
    this.text4Style,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: text1Style ??
                TextStyle(
                  fontSize: 12,
                  color: ColorConstants.blackColor,
                  fontWeight: FontWeight.w500,
                  decoration: decoration,
                ),
          ),
          TextSpan(
            text: text2,
            style: text2Style ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.blackColor,
                  decoration: decoration,
                ),
          ),
          TextSpan(
            text: text3,
            style: text3Style ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.blackColor,
                  decoration: decoration,
                ),
          ),
          TextSpan(
            text: text4,
            style: text4Style ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.blackColor,
                  decoration: decoration,
                ),
          ),
          // TextSpan(
          //   text: tappableText,
          //   style: tappableTextStyle ??
          //       const TextStyle(
          //         fontSize: 12,
          //         fontWeight: FontWeight.w500,
          //         color: ColorConstants.primaryButtonColor,
          //       ),
          //   recognizer: TapGestureRecognizer()..onTap = onTap,
          // ),
        ],
      ),
    );
  }
}
