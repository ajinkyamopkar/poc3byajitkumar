import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: !kIsWeb
          ? AppBar(
              backgroundColor: ColorConstants.whiteColor,
              foregroundColor: ColorConstants.whiteColor,
              shadowColor: ColorConstants.whiteColor,
              surfaceTintColor: ColorConstants.whiteColor,
              toolbarHeight: 10.h,
              leadingWidth: 15.w,
              title: const CustomText(
                text: StringConstants.myCart,
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
                    dashboardController.selectedIndex.value = 0;
                    Get.toNamed(AppRoutes.bottomNavBarPage);
                  },
                ),
              ),
            )
          : null,
      body: Padding(
          padding: EdgeInsets.only(
            top: 5.h,
            left: 4.w,
            right: 4.w,
            bottom: 5.h,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: ColorConstants.primary,
                  size: Responsive.isDesktop(context)
                      ? 40.sp
                      : Responsive.isTablet(context)
                          ? 60.sp
                          : 80.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  text: StringConstants.paymentSuccessful,
                  fontSize: Responsive.isDesktop(context)
                      ? 5
                      : Responsive.isTablet(context)
                          ? 8
                          : 12.sp,
                  color: ColorConstants.primaryTextColor,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  text: StringConstants.thankYouForYourPurchase,
                  fontSize: Responsive.isDesktop(context)
                      ? 6
                      : Responsive.isTablet(context)
                          ? 8
                          : 8.sp,
                  color: ColorConstants.secondaryTextColor,
                ),
              ],
            ),
          )),
    );
  }
}

// class OrderPlaced extends StatefulWidget {
//   const OrderPlaced({super.key});

//   @override
//   State<OrderPlaced> createState() => _OrderPlacedState();
// }

// class _OrderPlacedState extends State<OrderPlaced> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           "data",
//           style: TextStyle(color: Colors.amber),
//         ),
//       ),
//     );
//   }
// }
