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
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  final AuthController _authController = Get.find();
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  // Future<void> onInit() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   print("Token = $token");
  // }

  @override
  Widget build(BuildContext context) {
    // _authController.isLoggedIn();
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    Align(
                      child: CustomText(
                        text: StringConstants.signInText,
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
                          text: StringConstants.hiWelcomeBack,
                          color: ColorConstants.greyColor,
                          fontSize: Responsive.isDesktop(context) ? 4 : 12,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 4.w,
                          right: 4.w,
                        ),
                        child: SizedBox(
                          // width: 200.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: StringConstants.email,
                                color: ColorConstants.primaryTextColor,
                                fontSize:
                                    Responsive.isDesktop(context) ? 3.5 : 11,
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
                                    return 'Enter correct email';
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
                                    if (val!.isEmpty ||
                                        !RegExp(r'^.{6,}$').hasMatch(val)) {
                                      return 'Enter Valid Password';
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.forgotPassword);
                                    },
                                    child: CustomText(
                                      text: StringConstants.forgotPassword,
                                      color: ColorConstants.primary,
                                      fontSize: Responsive.isDesktop(context)
                                          ? 3.5
                                          : 11,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Center(
                                child: PrimaryButton(
                                  label: StringConstants.signInText,
                                  btnColor: ColorConstants.primary,
                                  height: 6.h,
                                  width: 100.w,
                                  fontSize: Responsive.isDesktop(context)
                                      ? 3.5.sp
                                      : 11.sp,
                                  fontWeight: FontWeight.w500,
                                  action: () {
                                    if (_formKey.currentState!.validate()) {
                                      _authController.loginWithEmail();
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
                                  GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(AppRoutes.bottomNavBarPage),
                                    child: CustomText(
                                      text: StringConstants.orSignUpWith,
                                      color: ColorConstants.greyColor,
                                      fontSize: Responsive.isDesktop(context)
                                          ? 3.5
                                          : 10,
                                      fontWeight: FontWeight.w400,
                                    ),
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
                                  GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(AppRoutes.profilePage),
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
                                            AssetConstant.appleIcon,
                                          ),
                                          width: Responsive.isDesktop(context)
                                              ? 1.5.w
                                              : 6.w,
                                        ),
                                        onPressed: () {},
                                      ),
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
                                          AssetConstant.facebookIcon,
                                        ),
                                        width: Responsive.isDesktop(context)
                                            ? 1.5.w
                                            : 6.w,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.5.h,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.signupView),
                                  child: CustomRichText(
                                    text1: StringConstants.dontHaveAnAccount,
                                    text1Style: TextStyle(
                                        fontSize: Responsive.isDesktop(context)
                                            ? 4.sp
                                            : 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstants.primaryTextColor),
                                    text2: StringConstants.signUp,
                                    text2Style: TextStyle(
                                      fontSize: Responsive.isDesktop(context)
                                          ? 4.sp
                                          : 13.sp,
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
