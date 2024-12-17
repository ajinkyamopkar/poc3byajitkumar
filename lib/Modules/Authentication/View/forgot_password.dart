import 'package:e_commerce_app/Modules/Authentication/Controller/auth_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/constant_textfeild.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});
  final AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  // final TextEditingController passwordController = TextEditingController();

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
                        text: StringConstants.forgotPassword,
                        color: ColorConstants.primaryTextColor,
                        fontSize: Responsive.isDesktop(context) ? 6 : 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    Center(
                      child: SizedBox(
                        width: Responsive.isDesktop(context) ? 35.w : 100.w,
                        child: CustomText(
                          text: StringConstants.enterYourEmailAddress,
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
                          width: 200.w,
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
                                    return StringConstants.validationEmail;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Center(
                                child: PrimaryButton(
                                  label: StringConstants.continueText,
                                  btnColor: ColorConstants.primary,
                                  height: 6.h,
                                  width: 100.w,
                                  fontSize: Responsive.isDesktop(context)
                                      ? 3.5.sp
                                      : 11.sp,
                                  fontWeight: FontWeight.w500,
                                  action: () {
                                    if (_formKey.currentState!.validate()) {
                                      Get.toNamed(
                                        AppRoutes.resetPage,
                                      );
                                    }
                                  },
                                ),
                              ),
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
