import 'package:e_commerce_app/Modules/Authentication/Controller/auth_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/asset_constant.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/constant_textfeild.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/rich_text.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();

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
                    SizedBox(height: 5.h),
                    Align(
                      child: CustomText(
                        text: StringConstants.createAccount,
                        color: ColorConstants.primaryTextColor,
                        fontSize: Responsive.isDesktop(context) ? 6 : 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    Center(
                      child: SizedBox(
                        width: 70.w,
                        child: CustomText(
                          text: StringConstants.fillYouInformation,
                          color: ColorConstants.greyColor,
                          fontSize: Responsive.isDesktop(context) ? 4 : 12,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.center,
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
                                controller: _authController.nameController,
                                hintText: StringConstants.johnDoe,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3 : 11,
                                hintTextColor: ColorConstants.greyColor,
                                keyboardType: TextInputType.name,
                                validator: (val) {
                                  if (val!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z 0-9]+$')
                                          .hasMatch(val)) {
                                    return StringConstants.validationUsername;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomText(
                                text: StringConstants.email,
                                color: ColorConstants.primaryTextColor,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3 : 11,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              ConstantTextfeild(
                                controller: _authController.emailController,
                                hintText: StringConstants.exampleGmailcom,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3 : 11,
                                hintTextColor: ColorConstants.greyColor,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val!.isEmpty ||
                                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                          .hasMatch(val)) {
                                    return StringConstants.validationEmail;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomText(
                                text: StringConstants.password,
                                color: ColorConstants.primaryTextColor,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3.5 : 11,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              Obx(
                                () => ConstantTextfeild(
                                  controller:
                                      _authController.passwordController,
                                  obscureText: _authController.isObscured.value,
                                  showPasswordIcon: true,
                                  onIconPressed:
                                      _authController.togglePasswordVisibility,
                                  hintText: StringConstants.password,
                                  hintTextColor:
                                      ColorConstants.secondaryTextColor,
                                  fontSize:
                                      Responsive.isDesktop(context) ? 3 : 11,
                                  validator: (val) {
                                    if (val!.isEmpty ) {
                                      return StringConstants.validationPassword;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => SizedBox(
                                      height: 2.h,
                                      width: Responsive.isDesktop(context)
                                          ? 2.w
                                          : 5.w,
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        value: _authController.rememberMe.value,
                                        onChanged: (value) {
                                          _authController.toggleRememberMe();
                                        },
                                        activeColor: ColorConstants.primary,
                                        checkColor: ColorConstants.whiteColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Responsive.isDesktop(context)
                                        ? 0.w
                                        : 2.w,
                                  ),
                                  CustomText(
                                    text: StringConstants.agreeWith,
                                    color: ColorConstants.primaryTextColor,
                                    fontSize:
                                        Responsive.isDesktop(context) ? 3 : 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text: StringConstants.termsCondition,
                                    color: ColorConstants.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        Responsive.isDesktop(context) ? 3 : 12,
                                    decoration: TextDecoration.underline,
                                  ),
                                ],
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
                                      : 11.sp,
                                  fontWeight: FontWeight.w500,
                                  action: () async {
                                    if (_formKey.currentState!.validate()) {
                                      Get.toNamed(
                                        AppRoutes.editProfilePage,
                                      );
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 0.05.h,
                                    width: Responsive.isDesktop(context)
                                        ? 8.w
                                        : 20.w,
                                    decoration: const BoxDecoration(
                                      color: ColorConstants.greyColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.5.w,
                                  ),
                                  CustomText(
                                    text: StringConstants.orSignUpWith,
                                    color: ColorConstants.greyColor,
                                    fontSize: Responsive.isDesktop(context)
                                        ? 3.5
                                        : 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    width: 2.5.w,
                                  ),
                                  Container(
                                    height: 0.05.h,
                                    width: Responsive.isDesktop(context)
                                        ? 8.w
                                        : 20.w,
                                    decoration: const BoxDecoration(
                                      color: ColorConstants.greyColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 3.w),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorConstants.lightGrayColor,
                                          width: 1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(1),
                                      icon: Image(
                                        image: const AssetImage(
                                          AssetConstant.appleIcon,
                                        ),
                                        width: Responsive.isDesktop(context)
                                            ? 1.5.w
                                            : 6.w,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 3.w),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorConstants.lightGrayColor,
                                          width: 1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(1),
                                      icon: Image(
                                        image: const AssetImage(
                                          AssetConstant.googleIcon,
                                        ),
                                        width: Responsive.isDesktop(context)
                                            ? 1.5.w
                                            : 6.w,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(AppRoutes.editProfilePage),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 3.w),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                ColorConstants.lightGrayColor,
                                            width: 1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        padding: const EdgeInsets.all(1),
                                        icon: Image(
                                          image: const AssetImage(
                                            AssetConstant.facebookIcon,
                                          ),
                                          width: Responsive.isDesktop(context)
                                              ? 1.5.w
                                              : 6.w,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.5.h,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(AppRoutes.loginView),
                                  child: CustomRichText(
                                    text1: StringConstants.alreadyHaveAnAccount,
                                    text1Style: TextStyle(
                                        fontSize: Responsive.isDesktop(context)
                                            ? 4.sp
                                            : 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstants.primaryTextColor),
                                    text2: StringConstants.signInText,
                                    text2Style: TextStyle(
                                      fontSize: Responsive.isDesktop(context)
                                          ? 4.sp
                                          : 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstants.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
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
