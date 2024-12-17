import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function()? action;
  final Color? btnColor, textColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Decoration? decoration;
  final Color? borderColor;
  final double? borderWidth;
  final bool shape;

  const PrimaryButton({
    super.key,
    required this.label,
    this.action,
    this.btnColor,
    this.textColor,
    this.width,
    this.height = 52,
    this.icon,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.decoration,
    this.borderColor,
    this.borderWidth,
    this.shape = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          // fixedSize: MaterialStateProperty.all(Size(Get.width, 48)),
          // maximumSize: MaterialStateProperty.all(Size(Get.width, 48)),
          backgroundColor:
              MaterialStateProperty.all(btnColor ?? ColorConstants.primary),
          shape: shape
              ? MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: borderColor ?? ColorConstants.lightGrayColor,
                      width: borderWidth ?? 1,
                    ),
                    borderRadius: BorderRadius.circular(
                        50), // Circular border when shape is true
                  ),
                )
              : null,
        ),
        onPressed: action,
        icon: icon != null
            ? Icon(icon, color: textColor ?? ColorConstants.whiteColor)
            : const SizedBox.shrink(),
        label: Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: textColor ?? ColorConstants.whiteColor,
          ),
        ),
      ),
    );
  }
}
