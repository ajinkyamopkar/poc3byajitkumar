import 'dart:developer';

import 'package:dotted_line/dotted_line.dart';
import 'package:e_commerce_app/Modules/Dashboard/Widgets/cart_item_widget.dart';
import 'package:e_commerce_app/Modules/Dashboard/Widgets/web_navbar.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartWeb extends StatefulWidget {
  CartWeb({super.key});

  @override
  State<CartWeb> createState() => _CartWebState();
}

class _CartWebState extends State<CartWeb> {
  @override
  void initState() {
    dashboardController.fetchCartDetails();
    super.initState();
  }

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    dashboardController.fetchCartDetails();
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: dashboardController.cartData.isEmpty
          ? const Center(
              child: CustomText(
                text: StringConstants.yourCartIsEmpty,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            )
          : Expanded(
              child: Responsive.isDesktop(context)
                  ? isDesktop()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const WebNavBar(),
                        Expanded(
                          child: Container(
                            color: ColorConstants.lightGrayColor,
                            child: SizedBox(
                              height: 50.h,
                              child: Obx(
                                () => ListView.builder(
                                  itemCount:
                                      dashboardController.cartData.length,
                                  itemBuilder: (context, index) {
                                    final item =
                                        dashboardController.cartData[index];

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
                                        return await showDeleteDialog(
                                            context, index);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CartItemWidget(
                                            image:
                                                '${ApiEndPoints.baseImageUrl}${item['product_id']['image'][0].toString()}',
                                            title: item['product_id']['name'],
                                            size: item['size'],
                                            price: item['product_id']['price']
                                                .toString(),
                                            borderThickness: 1,
                                            heightBetween: 1.5.h,
                                            sId: item['_id'].toString(),
                                            qty: RxInt(item['qty']),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: dashboardController.cartData.isNotEmpty &&
                                    dashboardController.cartData.length > 2
                                ? dashboardController.cartData.length * 40.h
                                : 50.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorConstants.lightGrayColor,
                                    width: 1.h,
                                    style: BorderStyle.solid)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                showCheckout(context),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
    );
  }

  Widget isDesktop() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WebNavBar(),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.0.w, right: 2.w),
                    child: Container(
                      color: ColorConstants.foreground,
                      child: SizedBox(
                        height: 70.h,
                        // width: 30.w,
                        child: Obx(
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
                                  return await showDeleteDialog(context, index);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CartItemWidget(
                                      image:
                                          '${ApiEndPoints.baseImageUrl}${item['product_id']['image'][0].toString()}',
                                      title: item['product_id']['name'],
                                      size: item['size'],
                                      price: item['product_id']['price']
                                          .toString(),
                                      borderThickness: 1,
                                      heightBetween: 1.5.h,
                                      sId: item['_id'].toString(),
                                      qty: RxInt(item['qty']),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 70.h,
                    // color: ColorConstants.successColor,
                    decoration: BoxDecoration(
                      color: ColorConstants.foreground,
                      // border: Border.all(
                      //     color: ColorConstants.lightGrayColor,
                      //     width: 1.h,
                      //     style: BorderStyle.solid)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        showCheckout(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> showDeleteDialog(BuildContext context, int index) async {
    final item = dashboardController.cartData[index];
    log("item id : ${item['_id']}");

    return await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: EdgeInsets.only(top: 1.5.h, bottom: 4.h),
              content: SizedBox(
                height: Responsive.isTablet(context) ? 50.h : 36.h,
                width: Responsive.isTablet(context) ? 80.w : 40.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomText(
                      text: StringConstants.removeFromCart,
                      fontSize: Responsive.isTablet(context) ? 10 : 3,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 1.h),
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
                      height: 1.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: Responsive.isTablet(context) ? 12.w : 10.w,
                          child: PrimaryButton(
                            height: Responsive.isTablet(context) ? 6.h : 4.h,
                            label: StringConstants.cancle,
                            action: () => Navigator.of(context).pop(),
                            btnColor: ColorConstants.neutralGrayColor,
                            textColor: ColorConstants.primary,
                            borderColor: ColorConstants.neutralGrayColor,
                            shape: true,
                            fontSize: Responsive.isTablet(context) ? 14 : 14,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        SizedBox(
                          width: Responsive.isTablet(context) ? 12.w : 10.w,
                          child: PrimaryButton(
                            height: Responsive.isTablet(context) ? 6.h : 4.h,
                            label: StringConstants.yesRemove,
                            action: () {
                              log("remove is clicked");
                              dashboardController.removeProduct(item['_id']);
                              dashboardController.fetchCartDetails();
                              log("total cart : ${dashboardController.cartTotalData.first["subtotal"].toString()}");

                              if (dashboardController
                                      .selectedCoupon.value.isNotEmpty &&
                                  dashboardController
                                      .cartTotalData.isNotEmpty) {
                                dashboardController.verifyCoupon(
                                  dashboardController.selectedCoupon.value
                                      .toString(),
                                  dashboardController
                                      .cartTotalData.first['subtotal'],
                                  dashboardController
                                      .cartTotalData.first['discount'],
                                  dashboardController
                                      .cartTotalData.first['deliveryfee'],
                                );
                              }

                              Navigator.of(context).pop(true);
                            },
                            fontSize: Responsive.isTablet(context) ? 14 : 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }

  Widget showCheckout(BuildContext context) {
    final DashboardController dashboardController =
        Get.find<DashboardController>();
    return Container(
      color: ColorConstants.foreground,
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 15.w,
          bottom: 4.h,
          top: 3.h,
        ),
        child: Container(
          color: ColorConstants.foreground,
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
                                height: 1.2.h,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            hintText: StringConstants.applyCoupon,
                            hintStyle: TextStyle(
                              color: ColorConstants.greyColor,
                              fontSize: Responsive.isTablet(context) ? 6 : 3,
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
                          CustomText(
                            text: StringConstants.subTotal,
                            color: ColorConstants.greyColor,
                            fontSize: Responsive.isTablet(context) ? 6 : 3,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: dashboardController
                                    .verifyCouponData.isNotEmpty
                                ? "\$ ${dashboardController.verifyCouponData[0].subtotal.toString()}"
                                : "\$ ${dashboardController.cartTotalData.first['subtotal'].toString()}",
                            color: ColorConstants.blackColor,
                            fontSize: Responsive.isTablet(context) ? 6 : 3,
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
                          CustomText(
                            text: StringConstants.deliveryFee,
                            color: ColorConstants.greyColor,
                            fontSize: Responsive.isTablet(context) ? 6 : 3,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: dashboardController
                                    .verifyCouponData.isNotEmpty
                                ? "\$ ${dashboardController.verifyCouponData[0].deliveryfee.toString()}"
                                : "\$ ${dashboardController.cartTotalData.first['deliveryfee'].toString()}",
                            color: ColorConstants.blackColor,
                            fontSize: Responsive.isTablet(context) ? 6 : 3,
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
                          CustomText(
                            text: StringConstants.discount,
                            color: ColorConstants.greyColor,
                            fontSize: Responsive.isTablet(context) ? 6 : 3,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: dashboardController
                                    .verifyCouponData.isNotEmpty
                                ? "\$ ${dashboardController.verifyCouponData[0].discount.toString()}"
                                : "\$ ${dashboardController.cartTotalData.first['discount'].toString()}",
                            color: ColorConstants.blackColor,
                            fontSize: Responsive.isTablet(context) ? 6 : 3,
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
                          CustomText(
                            text: StringConstants.totalCost,
                            color: ColorConstants.greyColor,
                            fontSize: Responsive.isTablet(context) ? 6 : 3,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: dashboardController
                                    .verifyCouponData.isNotEmpty
                                ? "\$ ${dashboardController.verifyCouponData[0].total.toString()}"
                                : "\$ ${dashboardController.cartTotalData.first['total'].toString()}",
                            color: ColorConstants.blackColor,
                            fontSize: Responsive.isTablet(context) ? 6 : 3,
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
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        action: () {
                          log("checkout is clicked : ${dashboardController.cartTotalData.first['data']['_id'].toString()}");
                          dashboardController.chekout(dashboardController
                              .cartTotalData.first['data']['_id']
                              .toString());
                          Get.toNamed(AppRoutes.orderPlacedPage);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
