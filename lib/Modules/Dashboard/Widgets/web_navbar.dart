import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Routes/app_routes.dart';

class WebNavBar extends StatelessWidget {
  const WebNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorConstants.primary,
        // borderRadius: BorderRadius.circular(1.w)
      ),
      height: Responsive.isDesktop(context) ? 8.h : 4.h,
      child: Padding(
        padding: EdgeInsets.only(
          // top: Responsive.isDesktop(context) ? 2.h : 2.h,
          left: Responsive.isDesktop(context) ? 4.w : 4.w,
          right: Responsive.isDesktop(context) ? 4.w : 4.w,
          // bottom: Responsive.isDesktop(context) ? 2.h : 2.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Get.offNamed(AppRoutes.dashBoardPage);
                    },
                    child: CustomText(
                      text: StringConstants.home,
                      color: ColorConstants.whiteColor,
                      fontSize: Responsive.isDesktop(context) ? 4 : 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: Responsive.isDesktop(context) ? 2.5.w : 2.w,
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Get.offNamed(AppRoutes.cartWebPage);
                    },
                    child: CustomText(
                      text: StringConstants.cart,
                      color: ColorConstants.whiteColor,
                      fontSize: Responsive.isDesktop(context) ? 4 : 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: Responsive.isDesktop(context) ? 2.5.w : 2.w,
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Get.offNamed(AppRoutes.myWishlistPage);
                    },
                    child: CustomText(
                      text: StringConstants.wishlist,
                      color: ColorConstants.whiteColor,
                      fontSize: Responsive.isDesktop(context) ? 4 : 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: Responsive.isDesktop(context) ? 2.5.w : 2.w,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Get.offNamed(AppRoutes.profilePage),
              child: FittedBox(
                child: CustomText(
                  text: StringConstants.profile,
                  color: ColorConstants.whiteColor,
                  fontSize: Responsive.isDesktop(context) ? 4 : 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
