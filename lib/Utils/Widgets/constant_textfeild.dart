import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConstantTextfeild extends StatelessWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String obscuringCharacter;
  final Color hintTextColor;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final bool isDatePicker;
  final bool isPhoneNumber;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onIconPressed;
  final bool showPasswordIcon;
  final bool? enabled;
  final double? fontSize;
  final Widget? prefix;
  final String? Function(String? val)? validator;
  final Icon? prefixIcon;
  // final Widget? suffixIcon;

  const ConstantTextfeild({
    super.key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.hintTextColor = ColorConstants.blackColor,
    this.isDropdown = false,
    this.dropdownItems,
    this.isDatePicker = false,
    this.isPhoneNumber = false,
    this.controller,
    this.onChanged,
    this.onIconPressed,
    this.showPasswordIcon = false,
    this.enabled = true,
    this.validator,
    this.fontSize = 12,
    this.prefix,
    this.prefixIcon,
    // this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (isDropdown && dropdownItems != null) {
      return DropdownButtonFormField<String>(
        dropdownColor: ColorConstants.whiteColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: ColorConstants.textBorderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: ColorConstants.textBorderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: ColorConstants.textBorderColor,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        items: dropdownItems!.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          if (onChanged != null) {
            onChanged!(newValue!);
          }
        },
        value: controller?.text.isNotEmpty ?? false ? controller?.text : null,
      );
    } else {
      return TextFormField(
        keyboardType: isPhoneNumber ? TextInputType.phone : keyboardType,
        validator: validator,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        cursorRadius: const Radius.circular(20),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: ColorConstants.textBorderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: ColorConstants.textBorderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: ColorConstants.textBorderColor,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: fontSize?.sp,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.all(16),
          suffixIcon: showPasswordIcon
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onIconPressed,
                )
              : null,
          prefix: prefix,
          prefixIcon: prefixIcon,
        ),
        controller: controller,
        onChanged: onChanged,
        enabled: enabled,
      );
    }
  }
}
