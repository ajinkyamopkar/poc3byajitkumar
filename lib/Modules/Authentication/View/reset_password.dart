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

class ResetPasswordView extends StatelessWidget {
  final AuthController _authController = Get.find();
  ResetPasswordView({super.key});
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: StringConstants.newPassword,
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
                          text: StringConstants.yourNewPassword,
                          color: ColorConstants.greyColor,
                          fontSize: Responsive.isDesktop(context) ? 3.5 : 11,
                          fontWeight: FontWeight.w400,
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
                          width: 200.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                        !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
                                            .hasMatch(val)) {
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
                              CustomText(
                                text: StringConstants.confirmPassword,
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
                                      _authController.confirmPasswordController,
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
                                        !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
                                            .hasMatch(val)) {
                                      return StringConstants.validationPassword;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Center(
                                child: PrimaryButton(
                                  label: StringConstants.createNewPassword,
                                  btnColor: ColorConstants.primary,
                                  height: 6.h,
                                  width: 100.w,
                                  fontSize: Responsive.isDesktop(context)
                                      ? 3.5.sp
                                      : 13.sp,
                                  fontWeight: FontWeight.w500,
                                  action: () {
                                    if (_formKey.currentState!.validate()) {
                                      _authController.forgotPassword();
                                      Get.toNamed(
                                        AppRoutes.loginView,
                                      );
                                      Get.snackbar("Password Changed",
                                          "Password rest Successfully");
                                      // _authController.signUp();
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
