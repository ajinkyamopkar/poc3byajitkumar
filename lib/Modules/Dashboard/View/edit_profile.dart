// import 'package:e_commerce_app/Modules/Authentication/Controller/auth_controller.dart';

import 'package:e_commerce_app/Modules/Authentication/Controller/auth_controller.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Utils/Constants/asset_constant.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/constant_textfeild.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final DashboardController _dashboardController = Get.find();
  final AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final List<String> countryCodes = [
    '+1', // USA
    '+91', // India
    '+44', // UK
    '+61', // Australia
    '+81', // Japan
    '+49', // Germany
    '+33', // France
  ];
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: 5.h,
          left: 4.w,
          right: 4.w,
          bottom: 2.h,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: SizedBox(
                width: Responsive.isDesktop(context) ? 40.w : 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 10.w,
                          margin: EdgeInsets.only(left: 2.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorConstants.lightGrayColor, width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(1),
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Align(
                      child: CustomText(
                        text: StringConstants.completeYourProfile,
                        color: ColorConstants.primaryTextColor,
                        fontSize: Responsive.isDesktop(context) ? 5.5 : 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    Center(
                      child: SizedBox(
                        width: Responsive.isDesktop(context) ? 30.w : 70.w,
                        child: CustomText(
                          text: StringConstants.dontWorryOnly,
                          color: ColorConstants.greyColor,
                          fontSize: Responsive.isDesktop(context) ? 3 : 10,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.photo_library),
                                    title: const Text('Gallery'),
                                    onTap: () {
                                      _authController.pickImageFromGallery();
                                      Get.back();
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.camera_alt),
                                    title: const Text('Camera'),
                                    onTap: () {
                                      _authController.pickImageFromCamera();
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            SizedBox(
                              height:
                                  Responsive.isDesktop(context) ? 18.h : 15.h,
                              width:
                                  Responsive.isDesktop(context) ? 25.w : 30.w,
                              child: CircleAvatar(
                                radius: 5.h,
                                backgroundImage:
                                    _authController.profileImage.value != null
                                        ? FileImage(
                                            _authController.profileImage.value!)
                                        : const AssetImage(
                                                AssetConstant.profileImage)
                                            as ImageProvider,
                              ),
                            ),
                            Positioned(
                              right:
                                  Responsive.isDesktop(context) ? 6.5.w : 0.w,
                              bottom: Responsive.isDesktop(context) ? 1.w : 0.w,
                              child: Container(
                                width: 10.w,
                                decoration: BoxDecoration(
                                  color: ColorConstants.primary,
                                  border: Border.all(
                                    color: ColorConstants.whiteColor,
                                    width: 3,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  iconSize: Responsive.isDesktop(context)
                                      ? 3.5.sp
                                      : 14.sp,
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: ColorConstants.whiteColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 4.w,
                          right: 4.w,
                        ),
                        child: SizedBox(
                          width: 200.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: StringConstants.name,
                                color: ColorConstants.primaryTextColor,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3.5 : 11,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              ConstantTextfeild(
                                enabled: false,
                                hintText: _authController.nameController.text,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3 : 11,
                                hintTextColor: ColorConstants.greyColor,
                                keyboardType: TextInputType.name,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomText(
                                text: StringConstants.phoneNumber,
                                color: ColorConstants.primaryTextColor,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3.5 : 11,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              ConstantTextfeild(
                                controller: _authController.phoneController,
                                hintText: StringConstants.enterPhoneNumber,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3 : 11,
                                hintTextColor: ColorConstants.greyColor,
                                keyboardType: TextInputType.phone,
                                prefix: Obx(
                                  () => SizedBox(
                                    height: 2.5.h,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: _dashboardController
                                            .selectedCountryCode.value,
                                        items: countryCodes.map((String code) {
                                          return DropdownMenuItem<String>(
                                            value: code,
                                            child: Text(
                                              code,
                                              style: TextStyle(
                                                  fontSize:
                                                      Responsive.isDesktop(
                                                              context)
                                                          ? 3.sp
                                                          : 11.sp,
                                                  color: ColorConstants.text),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          _dashboardController
                                              .selectedCountryCode
                                              .value = newValue!;
                                        },
                                        focusColor: ColorConstants.text,
                                      ),
                                    ),
                                  ),
                                ),
                                validator: (val) {
                                  if (val!.isEmpty ||
                                      !RegExp(r'^\d{10}$').hasMatch(val)) {
                                    return StringConstants
                                        .validationPhoneNumber;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomText(
                                text: StringConstants.gender,
                                color: ColorConstants.primaryTextColor,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3 : 11,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              ConstantTextfeild(
                                isDropdown: true,
                                dropdownItems: const [
                                  StringConstants.male,
                                  StringConstants.female,
                                  StringConstants.other,
                                ],
                                hintText: StringConstants.gender,
                                hintTextColor: ColorConstants.primaryTextColor,
                                controller: TextEditingController(
                                    text: _dashboardController.gender.value),
                                onChanged: (value) {
                                  _dashboardController.gender.value = value;
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomText(
                                text: StringConstants.address,
                                color: ColorConstants.primaryTextColor,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3.5 : 11,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              ConstantTextfeild(
                                controller: _authController.addressController,
                                hintText: StringConstants.mumbaiIndia,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3 : 11,
                                hintTextColor: ColorConstants.greyColor,
                                keyboardType: TextInputType.name,
                                validator: (val) {
                                  if (val!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
                                    return StringConstants.validationAddress;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Center(
                                child: PrimaryButton(
                                  label: StringConstants.signUp,
                                  btnColor: ColorConstants.primary,
                                  height: 6.h,
                                  width: 100.w,
                                  fontSize: Responsive.isDesktop(context)
                                      ? 3.5.sp
                                      : 13.sp,
                                  fontWeight: FontWeight.w500,
                                  action: () {
                                    if (_formKey.currentState!.validate()) {
                                      _authController.registerUser();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
