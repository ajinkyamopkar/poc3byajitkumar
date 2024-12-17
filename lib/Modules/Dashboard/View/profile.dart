import 'package:e_commerce_app/Modules/Dashboard/Widgets/web_navbar.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: !kIsWeb
          ? AppBar(
              toolbarHeight: Responsive.isDesktop(context) ? 8.h : 10.h,
              backgroundColor: ColorConstants.whiteColor,
              leadingWidth: Responsive.isDesktop(context) ? 32.w : 16.5.w,
              title: CustomText(
                text: StringConstants.profile,
                fontSize: Responsive.isDesktop(context) ? 5 : 13,
                fontWeight: FontWeight.w500,
              ),
              centerTitle: true,
              leading: Container(
                width: 10.w,
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
            )
          : null,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (kIsWeb) const WebNavBar(),
              Container(
                margin: EdgeInsets.only(left: 3.w, right: 3.w),
                width: Responsive.isDesktop(context) ? 40.w : 100.w,
                color: ColorConstants.whiteColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 90,
                            backgroundImage: NetworkImage(
                                ApiEndPoints.baseImageUrl +
                                    GetStorage().read('user_data')['data']
                                        ['image']),
                          ),
                          Container(
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.6.h,
                    ),
                    CustomText(
                      text: GetStorage().read('user_data')['data']['name'],
                      fontSize: Responsive.isDesktop(context) ? 5 : 16,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    profileListTile(StringConstants.yourProfile,
                        Icons.account_circle_outlined, context),
                    profileListTile(
                        StringConstants.paymentMethods, Icons.payment, context),
                    profileListTile(StringConstants.myOrders,
                        Icons.my_library_books_outlined, context),
                    profileListTile(StringConstants.settings,
                        Icons.settings_outlined, context),
                    profileListTile(StringConstants.helpCenter,
                        Icons.help_outline, context),
                    profileListTile(StringConstants.privacyPolicy,
                        Icons.lock_outline_rounded, context),
                    profileListTile(StringConstants.invitesFriends,
                        Icons.add_business_outlined, context),
                    profileListTile(
                      StringConstants.logOut,
                      Icons.logout_outlined,
                      context,
                      () {
                        Get.bottomSheet(
                          Container(
                            height: Responsive.isDesktop(context) ? 30.h : 26.h,
                            width: Responsive.isDesktop(context) ? 40.w : 100.w,
                            padding: EdgeInsets.only(top: 4.5.h),
                            decoration: const BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                CustomText(
                                  text: StringConstants.logOut,
                                  fontSize:
                                      Responsive.isDesktop(context) ? 5 : 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 2.4.h),
                                CustomText(
                                  text:
                                      StringConstants.areYouSureYouWantToLogOut,
                                  fontSize:
                                      Responsive.isDesktop(context) ? 4.5 : 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.greyColor,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: Responsive.isDesktop(context)
                                          ? 10.w
                                          : 42.w,
                                      child: PrimaryButton(
                                          height: Responsive.isDesktop(context)
                                              ? 6.h
                                              : 6.h,
                                          label: StringConstants.cancle,
                                          action: () => Get.back(),
                                          btnColor: ColorConstants.whiteColor,
                                          textColor: ColorConstants.primary,
                                          fontSize:
                                              Responsive.isDesktop(context)
                                                  ? 16
                                                  : 14),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    SizedBox(
                                      width: Responsive.isDesktop(context)
                                          ? 10.w
                                          : 42.w,
                                      child: PrimaryButton(
                                          height: Responsive.isDesktop(context)
                                              ? 6.h
                                              : 6.h,
                                          label: StringConstants.yesLogOut,
                                          action: () {
                                            GetStorage().erase();
                                            Get.offAllNamed(
                                                AppRoutes.loginView);
                                          },
                                          fontSize:
                                              Responsive.isDesktop(context)
                                                  ? 16
                                                  : 14),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileListTile(
    String? name,
    IconData? iconName,
    context, [
    Function()? onTap,
  ]) {
    return Column(
      children: [
        SizedBox(
          height: 5.45.h,
          child: ListTile(
            onTap: onTap ?? () {},
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconName,
                  size: Responsive.isDesktop(context) ? 7.sp : 20.sp,
                  color: ColorConstants.primary,
                ),
                SizedBox(
                  width: 3.w,
                ),
                CustomText(
                  text: name!,
                  fontSize: Responsive.isDesktop(context) ? 4 : 13,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorConstants.primary,
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
          indent: 12,
          endIndent: 24,
        ),
      ],
    );
  }
}
