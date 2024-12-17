import 'dart:developer';

import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String size;
  final String price;
  final double borderThickness;
  final double heightBetween;
  final String? sId;
  final RxInt qty;
  final bool isRemove;

  const CartItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.size,
    required this.price,
    required this.heightBetween,
    required this.borderThickness,
    this.sId,
    required this.qty,
    this.isRemove = true,
  });

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    log("cart id : $sId");
    return Obx(
      () => Column(
        children: [
          SizedBox(height: heightBetween),
          Padding(
            padding: EdgeInsets.only(left: 6.5.w, right: 6.5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    image,
                    width: Responsive.isDesktop(context) ? 5.w : 25.w,
                    height: Responsive.isDesktop(context) ? 10.h : 12.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: Responsive.isDesktop(context) ? 1.5.w : 4.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomText(
                        text: title,
                        fontSize: Responsive.isDesktop(context) ? 4 : 13,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.blackColor.withOpacity(0.8),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      CustomText(
                        text: "${StringConstants.size} $size",
                        fontSize: Responsive.isDesktop(context) ? 4 : 12,
                        color: ColorConstants.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "\$$price",
                            fontSize: Responsive.isDesktop(context) ? 3 : 13,
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              Container(
                                width:
                                    Responsive.isDesktop(context) ? 2.w : 6.5.w,
                                height:
                                    Responsive.isDesktop(context) ? 3.5.h : 3.h,
                                decoration: const BoxDecoration(
                                  color: ColorConstants.lightGrayColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(1),
                                  icon: Icon(
                                    Icons.remove,
                                    color: ColorConstants.blackColor,
                                    size:
                                        Responsive.isDesktop(context) ? 14 : 18,
                                  ),
                                  onPressed: () {
                                    var q = qty.value;
                                    if (qty.value != 1) {
                                      dashboardController.addQuantity(
                                          q - 1, sId ?? "");
                                    }

                                    // qty.value == 1
                                    //     ? (dashboardController.addQuantity(
                                    //         dashboardController
                                    //             .itemQuantity.value,
                                    //         sId!))
                                    //     : dashboardController.addQuantity(
                                    //         dashboardController
                                    //             .itemQuantity.value--,
                                    //         sId!);
                                  },
                                ),
                              ),
                              SizedBox(
                                width:
                                    Responsive.isDesktop(context) ? 1.w : 2.w,
                              ),
                              CustomText(
                                text: qty.toString(),
                                // '${dashboardController.itemQuantity.value}',
                                fontSize:
                                    Responsive.isDesktop(context) ? 4 : 14,
                                color: ColorConstants.blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                width:
                                    Responsive.isDesktop(context) ? 1.w : 2.w,
                              ),
                              Container(
                                width:
                                    Responsive.isDesktop(context) ? 2.w : 6.5.w,
                                height:
                                    Responsive.isDesktop(context) ? 3.5.h : 3.h,
                                decoration: const BoxDecoration(
                                  color: ColorConstants.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(1),
                                  icon: Icon(
                                    Icons.add,
                                    color: ColorConstants.whiteColor,
                                    size:
                                        Responsive.isDesktop(context) ? 14 : 18,
                                  ),
                                  onPressed: () {
                                    var q = qty.value;
                                    dashboardController.addQuantity(
                                        q + 1, sId ?? "");
                                    log("on tap increase pro id : $sId");
                                    // dashboardController.fetchCartDetails();
                                    // log(dashboardController.itemQuantity.value
                                    //     .toString());
                                    // dashboardController.itemQuantity.value++;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: heightBetween),
          Divider(
            height: 1.h,
            color: ColorConstants.lightGrayColor,
            thickness: borderThickness,
          ),
        ],
      ),
    );
  }
}
