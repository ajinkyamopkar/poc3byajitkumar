import 'dart:developer';

import 'package:dotted_line/dotted_line.dart';
import 'package:e_commerce_app/Modules/Dashboard/Widgets/cart_item_widget.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyCartView extends StatefulWidget {
  MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  @override
  void initState() {
    dashboardController.fetchCartDetails();
    super.initState();
  }

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    dashboardController.fetchCartDetails();
    // dashboardController.fetchCartDataDetails();
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
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
            border: Border.all(color: ColorConstants.lightGrayColor, width: 1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 24,
            icon: const Icon(
              Icons.arrow_back,
              color: ColorConstants.blackColor,
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.bottomNavBarPage);
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Column(
          children: [
            Expanded(
              child: dashboardController.cartData.isEmpty
                  ? Center(
                      heightFactor: 18,
                      child: CustomText(
                        text: StringConstants.yourCartIsEmpty,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Obx(
                      () => ListView.builder(
                        itemCount: dashboardController.cartData.length,
                        itemBuilder: (context, index) {
                          final item = dashboardController.cartData[index];

                          return Dismissible(
                            key: Key(item.toString()),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: ColorConstants.lightGrayColor,
                              alignment: Alignment.centerRight,
                              child: const Icon(Icons.delete,
                                  color: ColorConstants.whiteColor),
                            ),
                            confirmDismiss: (direction) async {
                              return await showDeleteBottomSheet(
                                  context, index);
                            },
                            child: Column(
                              children: [
                                CartItemWidget(
                                  image:
                                      '${ApiEndPoints.baseImageUrl}${item['product_id']['image'][0].toString()}',
                                  title: item['product_id']['name'],
                                  size: item['size'],
                                  price: item['product_id']['price'].toString(),
                                  borderThickness: 1,
                                  heightBetween: 1.5.h,
                                  sId: item['_id'].toString(),
                                  qty: RxInt(item['qty']),
                                  // isRemove: false,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
            SizedBox(
              width: 80.w,
              child: PrimaryButton(
                label: StringConstants.checkout,
                height: 6.h,
                action: () {
                  dashboardController.fetchCartDetails();
                  if (dashboardController.selectedCoupon.value.isNotEmpty &&
                      dashboardController.cartTotalData.isNotEmpty) {
                    dashboardController.verifyCoupon(
                        dashboardController.selectedCoupon.value.toString(),
                        dashboardController.cartTotalData.first['subtotal'],
                        dashboardController.cartTotalData.first['discount'],
                        dashboardController.cartTotalData.first['deliveryfee']);
                  }
                  dashboardController.cartData.isEmpty
                      ? Get.snackbar(StringConstants.cartIsEmpty,
                          StringConstants.addCartToCheckout)
                      : showCheckout(context);
                },
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteBottomSheet(BuildContext context, int index) async {
    final item = dashboardController.cartData[index];
    log("item id : ${item['_id']}");
    return await Get.bottomSheet(
          Container(
            height: 36.h,
            width: 100.w,
            padding: EdgeInsets.only(top: 1.5.h, bottom: 4.h),
            decoration: const BoxDecoration(
              color: ColorConstants.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const CustomText(
                  text: StringConstants.removeFromCart,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 2.4.h),
                CartItemWidget(
                  image:
                      '${ApiEndPoints.baseImageUrl}${item['product_id']['image'][0].toString()}',
                  title: item['product_id']['name'],
                  size: item['size'],
                  price: item['product_id']['price'].toString(),
                  borderThickness: 0,
                  heightBetween: 0,
                  sId: item['_id'].toString(),
                  qty: RxInt(item['qty']),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 42.w,
                      child: PrimaryButton(
                        height: 6.h,
                        label: StringConstants.cancle,
                        action: () => Get.back(),
                        btnColor: ColorConstants.neutralGrayColor,
                        textColor: ColorConstants.primary,
                        borderColor: ColorConstants.neutralGrayColor,
                        shape: true,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    SizedBox(
                      width: 42.w,
                      child: PrimaryButton(
                        height: 6.h,
                        label: StringConstants.yesRemove,
                        action: () {
                          log("remove is clicked");
                          dashboardController.removeProduct(item['_id']);
                          dashboardController.fetchCartDetails();
                          log("total cart : ${dashboardController.cartTotalData.first["subtotal"].toString()}");

                          if (dashboardController
                                  .selectedCoupon.value.isNotEmpty &&
                              dashboardController.cartTotalData.isNotEmpty) {
                            dashboardController.verifyCoupon(
                                dashboardController.selectedCoupon.value
                                    .toString(),
                                dashboardController
                                    .cartTotalData.first['subtotal'],
                                dashboardController
                                    .cartTotalData.first['discount'],
                                dashboardController
                                    .cartTotalData.first['deliveryfee']);
                          }

                          // log("total cart after coupon : ${dashboardController.verifyCouponData[0].subtotal.toString()}");
                          Get.back(result: true);
                        },
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          isDismissible: true,
        ) ??
        false;
  }

  void showCheckout(BuildContext context) {
    final DashboardController dashboardController =
        Get.find<DashboardController>();
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorConstants.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            bottom: 4.h,
            top: 3.h,
          ),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 1.w,
                          right: 1.w,
                        ),
                        child: TextField(
                          controller: TextEditingController(
                              text: dashboardController.selectedCoupon.isEmpty
                                  ? StringConstants.promoCode
                                  : dashboardController.selectedCoupon.value),
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                right: 1.5.w,
                                top: 0.5.h,
                                bottom: 0.5.h,
                              ),
                              child: PrimaryButton(
                                label: StringConstants.apply,
                                action: () => Get.toNamed(AppRoutes.couponPage),
                                btnColor: ColorConstants.primary,
                                height: 4.5.h,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            hintText: StringConstants.applyCoupon,
                            hintStyle: const TextStyle(
                              color: ColorConstants.greyColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: ColorConstants.background,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: ColorConstants.background,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: ColorConstants.background,
                              ),
                            ),
                          ),
                          style:
                              const TextStyle(color: ColorConstants.greyColor),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: StringConstants.subTotal,
                            color: ColorConstants.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: dashboardController
                                    .verifyCouponData.isNotEmpty
                                ? "\$ ${dashboardController.verifyCouponData[0].subtotal.toString()}"
                                : "\$ ${dashboardController.cartTotalData.first['subtotal'].toString()}",
                            color: ColorConstants.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: StringConstants.deliveryFee,
                            color: ColorConstants.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: dashboardController
                                    .verifyCouponData.isNotEmpty
                                ? "\$ ${dashboardController.verifyCouponData[0].deliveryfee.toString()}"
                                : "\$ ${dashboardController.cartTotalData.first['deliveryfee'].toString()}",
                            color: ColorConstants.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: StringConstants.discount,
                            color: ColorConstants.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: dashboardController
                                    .verifyCouponData.isNotEmpty
                                ? "\$ ${dashboardController.verifyCouponData[0].discount.toString()}"
                                : "\$ ${dashboardController.cartTotalData.first['discount'].toString()}",
                            color: ColorConstants.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DottedLine(
                        dashColor: ColorConstants.lightGrayColor,
                        lineThickness: 1,
                        dashGapColor: ColorConstants.whiteColor,
                        dashGapLength: 2.w,
                        dashLength: 2.w,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: StringConstants.totalCost,
                            color: ColorConstants.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: dashboardController
                                    .verifyCouponData.isNotEmpty
                                ? "\$ ${dashboardController.verifyCouponData[0].total.toString()}"
                                : "\$ ${dashboardController.cartTotalData.first['total'].toString()}",
                            color: ColorConstants.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      PrimaryButton(
                        label: StringConstants.proceedToCheckout,
                        btnColor: ColorConstants.primary,
                        height: 6.h,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        action: () {
                          log("checkout is clicked : ${dashboardController.cartTotalData.first['data']['_id'].toString()}");
                          dashboardController.chekout(dashboardController
                              .cartTotalData.first['data']['_id']
                              .toString());

                          // dashboardController.checkoutCart(dashboardController
                          //     .cartTotalData.first['data']['_id']
                          //     .toString());

                          // dashboardController.selectedIndex.value = 1;
                          Get.toNamed(AppRoutes.orderPlacedPage);
                          // Navigator.of(context).pushNamed("/order_placed.dart");

                          // OrderPlaced();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
