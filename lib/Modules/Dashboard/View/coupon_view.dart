import 'package:e_commerce_app/Modules/Dashboard/Widgets/web_navbar.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Utils/Constants/asset_constant.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CouponView extends StatelessWidget {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: !kIsWeb
          ? AppBar(
              backgroundColor: ColorConstants.whiteColor,
              foregroundColor: ColorConstants.blackColor,
              shadowColor: ColorConstants.whiteColor,
              surfaceTintColor: ColorConstants.whiteColor,
              toolbarHeight: 10.h,
              leadingWidth: 15.w,
              title: const CustomText(
                text: StringConstants.coupon,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
              centerTitle: true,
              leading: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 4.w,
                ),
                padding: EdgeInsets.all(
                  0.6.w,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorConstants.lightGrayColor, width: 1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  iconSize: 24,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ColorConstants.blackColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            )
          : null,
      body: Padding(
        padding: EdgeInsets.only(
          left: 6.w,
          right: 6.w,
          bottom: 2.h,
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (kIsWeb) const WebNavBar(),
              CustomText(
                text: StringConstants.bestOffersForYou,
                fontSize: Responsive.isDesktop(context) ? 6 : 15,
                fontWeight: FontWeight.w500,
                color: ColorConstants.blackColor,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dashboardController.couponData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CouponItem(
                          dashboardController.couponData[index].title ??
                              StringConstants.noTitle,
                          dashboardController.couponData[index].descreption ??
                              StringConstants.noDescription,
                          '${StringConstants.get} ₹${dashboardController.couponData[index].amount} ${StringConstants.off}',
                          StringConstants.copyCode,
                          context,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CouponItem(String title, String description, String amount,
      String copy, BuildContext context) {
    final DashboardController dashboardController = Get.find();
    return Padding(
      padding: EdgeInsets.only(
        left: 1.5.w,
        right: 1.5.w,
        top: 0.2.h,
      ),
      child: SizedBox(
        width: Responsive.isDesktop(context)
            ? 30.w
            : Responsive.isTablet(context)
                ? 50.w
                : null,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: ColorConstants.lightGrayColor,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: Responsive.isDesktop(context) ? 2.w : 4.w,
                      right: Responsive.isDesktop(context) ? 2.w : 4.w,
                      top: 2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: title,
                          fontSize: Responsive.isDesktop(context)
                              ? 5
                              : Responsive.isTablet(context)
                                  ? 8
                                  : 14,
                          color: ColorConstants.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        CustomText(
                          text: description,
                          fontSize: Responsive.isDesktop(context)
                              ? 3.5
                              : Responsive.isTablet(context)
                                  ? 6
                                  : 12.5,
                          color: ColorConstants.greyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                AssetConstant.couponIcon,
                              ),
                              height: Responsive.isDesktop(context)
                                  ? 18
                                  : Responsive.isTablet(context)
                                      ? 8.sp
                                      : 24,
                            ),
                            SizedBox(
                              width:
                                  Responsive.isDesktop(context) ? 0.5.w : 1.w,
                            ),
                            CustomText(
                              text: amount,
                              fontSize: Responsive.isDesktop(context)
                                  ? 3.5
                                  : Responsive.isTablet(context)
                                      ? 6
                                      : 14,
                              color: ColorConstants.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      dashboardController.setCoupon(title);
                      dashboardController.verifyCoupon(
                          dashboardController.selectedCoupon.value.toString(),
                          dashboardController.cartTotalData.first['subtotal'],
                          dashboardController.cartTotalData.first['discount'],
                          dashboardController
                              .cartTotalData.first['deliveryfee']);
                      Get.back();
                      Get.snackbar(StringConstants.couponApplied,
                          "${StringConstants.couponCode} $title");
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: 6.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        color: ColorConstants.background,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: CustomText(
                        text: copy,
                        fontSize: Responsive.isDesktop(context)
                            ? 5
                            : Responsive.isTablet(context)
                                ? 8
                                : 16,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
