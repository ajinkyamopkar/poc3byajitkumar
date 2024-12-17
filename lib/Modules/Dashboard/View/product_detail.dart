import 'dart:ui';

import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProductDetailView extends StatefulWidget {
  ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final DashboardController dashboardController = Get.find();

  @override
  void initState() {
    dashboardController.showAllImages.value = false;
    dashboardController.activePage.value = 0;
    dashboardController.predefineColor(
        dashboardController.productOnClickId.value?.colorchart?[0] ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var item = dashboardController.productOnClickId;
    return kIsWeb
        ? isWeb()
        : Scaffold(
            body: SizedBox(
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: 46.5.h,
                            child: PageView.builder(
                              controller: dashboardController.pageController,
                              itemCount: item.value?.image!.length,
                              onPageChanged: (value) {
                                dashboardController.changeActivePage(value);
                              },
                              itemBuilder: (context, index) {
                                return Image.network(
                                  ApiEndPoints.baseImageUrl +
                                      item.value!.image![index],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5.8.w),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorConstants.whiteColor,
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(1),
                                      iconSize: 12,
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: ColorConstants.blackColor,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                  const CustomText(
                                    text: StringConstants.productDetails,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 5.8.w),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorConstants.whiteColor,
                                    ),
                                    child: IconButton(
                                      iconSize: 26,
                                      icon: dashboardController.isProductFav
                                              .contains(dashboardController
                                                  .productOnClickId.value!.sId
                                                  .toString())
                                          ? const Icon(
                                              Icons.favorite,
                                              color: ColorConstants.primary,
                                            )
                                          : const Icon(
                                              Icons.favorite_outline_outlined,
                                              color: ColorConstants.primary,
                                            ),
                                      onPressed: () {
                                        dashboardController.likeProduct(
                                            dashboardController
                                                .productOnClickId.value!.sId
                                                .toString(),
                                            dashboardController.productOnClickId
                                                .value!.categoryId!.sId
                                                .toString());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: 2.5.h, top: 26.h),
                                height: 6.8.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorConstants.whiteColor,
                                ),
                                child: Obx(() {
                                  bool showAll =
                                      dashboardController.showAllImages.value;

                                  int itemCount = showAll
                                      ? item.value!.image!.length
                                      : (item.value!.image!.length > 2
                                          ? 4
                                          : item.value!.image!.length);

                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: itemCount,
                                    itemBuilder: (context, index) {
                                      if (index == 3 && !showAll) {
                                        int remainingImages =
                                            item.value!.image!.length - 2;

                                        return InkWell(
                                          onTap: () {
                                            dashboardController
                                                .showAllImages.value = true;
                                          },
                                          child: Container(
                                            width: 14.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: Center(
                                              child: CustomText(
                                                text: '+$remainingImages',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return InkWell(
                                          onTap: () {
                                            dashboardController
                                                .changeActivePage(index);
                                          },
                                          child: Obx(() {
                                            bool isSelected =
                                                dashboardController
                                                        .activePage.value ==
                                                    index;
                                            return Transform.scale(
                                              scale: isSelected ? 1.2 : 1.0,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  top: 0.8.h,
                                                  bottom: 0.8.h,
                                                  left: 1.4.w,
                                                  right: 1.4.w,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                      ApiEndPoints
                                                              .baseImageUrl +
                                                          item.value!
                                                              .image![index]),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      }
                                    },
                                  );
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 6.8.w, left: 6.8.w, top: 4.h, bottom: 4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: item.value!.categoryId!.name!,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.greyColor,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber[500],
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    CustomText(
                                      text: item.value!.rating!.toString(),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.greyColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            CustomText(
                              text: item.value!.name!,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.blackColor,
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            const CustomText(
                              text: StringConstants.productDetails,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.blackColor,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            CustomText(
                              text: item.value!.description!,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.justify,
                              color: ColorConstants.greyColor,
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Divider(
                              thickness: 0.1.h,
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            const CustomText(
                              text: StringConstants.selectSize,
                              color: ColorConstants.blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 4.h,
                                  child: ListView.builder(
                                    itemCount: item.value!.sizechart!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      String size =
                                          item.value!.sizechart![index];
                                      return Obx(
                                        () {
                                          bool isSelected = dashboardController
                                                  .selectedProductSize.value ==
                                              size;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              dashboardController
                                                  .selectSize(size);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: isSelected
                                                    ? ColorConstants.primary
                                                    : ColorConstants.whiteColor,
                                                border: Border.all(
                                                  color: isSelected
                                                      ? ColorConstants.primary
                                                      : ColorConstants
                                                          .lightGrayColor,
                                                ),
                                              ),
                                              margin:
                                                  EdgeInsets.only(right: 4.w),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: CustomText(
                                                  text: size,
                                                  fontSize: 9.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: isSelected
                                                      ? ColorConstants
                                                          .whiteColor
                                                      : ColorConstants
                                                          .blackColor,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                dashboardController.selectedProductSize.isEmpty
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            top: 2, bottom: 1.h),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: StringConstants
                                                  .pleaseSelectASize,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstants.errorColor,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: 1.h,
                                      ),
                              ],
                            ),

                            //API
                            const CustomText(
                              text: "${StringConstants.selectColor} Brown",
                              color: ColorConstants.blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 3.5.h,
                              child: ListView.builder(
                                itemCount: item.value!.colorchart!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      String selectedColor =
                                          item.value!.colorchart![index];
                                      dashboardController
                                          .selectColor(selectedColor);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 2.w),
                                      height: 3.5.h,
                                      width: 6.5.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(int.parse(
                                            item.value!.colorchart![index])),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Obx(
                                        () => Container(
                                          height: 12,
                                          width: 12,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: dashboardController
                                                        .selectedProductColorList
                                                        .value ==
                                                    item.value!
                                                        .colorchart![index]
                                                // .contains(dashboardController
                                                //     .productColorList[index])
                                                ? Colors.white
                                                : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            dashboardController.selectedProductColorList.isEmpty
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(top: 2, bottom: 1.h),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: StringConstants
                                              .pleaseSelectAColor,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: ColorConstants.errorColor,
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    height: 1.h,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 9.5.h,
              width: 100.w,
              decoration: const BoxDecoration(
                color: ColorConstants.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.lightGrayColor,
                    spreadRadius: 2,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: StringConstants.totalPrice,
                        fontSize: 11.5,
                        color: ColorConstants.greyColor,
                      ),
                      CustomText(
                        text: ("\$ ${item.value!.price!.toString()}"),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 50.w,
                    height: 5.8.h,
                    child: PrimaryButton(
                      icon: Icons.shopping_bag_outlined,
                      label: StringConstants.addToCart,
                      action: () {
                        dashboardController.selectedProductSize.isNotEmpty &&
                                dashboardController
                                    .selectedProductColorList.isNotEmpty
                            ? {
                                dashboardController.addToCart(
                                    dashboardController
                                        .productOnClickId.value!.sId
                                        .toString(),
                                    dashboardController.selectedProductSize
                                        .toString()),
                                Get.snackbar(StringConstants.addedToCart,
                                    StringConstants.productAddedToCart,
                                    snackPosition: SnackPosition.TOP),
                              }
                            : {};
                      },
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget isWeb() {
    var item = dashboardController.productOnClickId;
    return Scaffold(
      body: Wrap(
        spacing: 20,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        runSpacing: 20,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        // direction: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Responsive.isDesktop(context) ? 4.h : 2.h,
              left: Responsive.isDesktop(context)
                  ? 4.w
                  : Responsive.isTablet(context)
                      ? 3.w
                      : 2.w,
              right: Responsive.isDesktop(context)
                  ? 4.w
                  : Responsive.isTablet(context)
                      ? 3.w
                      : 2.w,
              bottom: Responsive.isDesktop(context) ? 2.h : 2.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                      width: 30.w,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                        ),
                        child: PageView.builder(
                          controller: dashboardController.pageController,
                          itemCount: item.value?.image!.length,
                          onPageChanged: (value) {
                            dashboardController.changeActivePage(value);
                          },
                          itemBuilder: (context, index) {
                            return Image.network(
                              ApiEndPoints.baseImageUrl +
                                  item.value!.image![index],
                              fit: BoxFit.fitHeight,
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 2.5.h, top: 5.h),
                      height: 6.8.h,
                      width: item.value!.image!.length * 8.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // color: ColorConstants.whiteColor,
                      ),
                      child: Obx(() {
                        bool showAll = dashboardController.showAllImages.value;

                        int itemCount = showAll
                            ? item.value!.image!.length
                            : (item.value!.image!.length > 2
                                ? 4
                                : item.value!.image!.length);

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            if (index == 3 && !showAll) {
                              int remainingImages =
                                  item.value!.image!.length - 2;

                              return GestureDetector(
                                onTap: () {
                                  dashboardController.showAllImages.value =
                                      true;
                                },
                                child: Container(
                                  width: item.value!.image!.length * 4.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: '+$remainingImages',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  dashboardController.changeActivePage(index);
                                },
                                child: Obx(() {
                                  bool isSelected =
                                      dashboardController.activePage.value ==
                                          index;
                                  return Transform.scale(
                                    scale: isSelected ? 1.2 : 1.0,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 0.8.h,
                                        bottom: 0.8.h,
                                        left: 1.4.w,
                                        right: 1.4.w,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            ApiEndPoints.baseImageUrl +
                                                item.value!.image![index]),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }
                          },
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? 4.w
                      : Responsive.isTablet(context)
                          ? 2.w
                          : 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: CustomText(
                        text: item.value!.name!,
                        fontSize: Responsive.isDesktop(context)
                            ? 4
                            : Responsive.isTablet(context)
                                ? 7
                                : 10,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 2.h : 2.h,
                    ),
                    FittedBox(
                      child: CustomText(
                        text: ("\$ ${item.value!.price!.toString()}"),
                        fontSize: Responsive.isDesktop(context)
                            ? 4
                            : Responsive.isTablet(context)
                                ? 7
                                : 10,

                        // fontSize: Responsive.isDesktop(context) ? 4 : 13.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 2.h : 2.h,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          CustomText(
                            text: item.value!.description!,
                            color: ColorConstants.greyColor,
                            fontSize: Responsive.isDesktop(context)
                                ? 3
                                : Responsive.isTablet(context)
                                    ? 7
                                    : 10,

                            // fontSize:
                            //     Responsive.isDesktop(context) ? 3 : 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 2.h : 2.h,
                    ),
                    SizedBox(
                      height: 2.h,
                      width: 26.w,
                      child: Divider(
                        height: 1.5,
                        color: ColorConstants.lightGrayColor,
                        thickness: 0.1.h,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 2.h : 2.h,
                    ),
                    FittedBox(
                      child: CustomText(
                        text: "${StringConstants.selectColor} Brown",
                        color: ColorConstants.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: Responsive.isDesktop(context)
                            ? 3
                            : Responsive.isTablet(context)
                                ? 7
                                : 10,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 1.h : 0.7.h,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          SizedBox(
                            height: 3.5.h,
                            width: item.value!.colorchart!.length * 3.w,
                            child: ListView.builder(
                              itemCount: item.value!.colorchart!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  // splashColor: Colors.transparent,
                                  onTap: () {
                                    String selectedColor =
                                        item.value!.colorchart![index];
                                    dashboardController
                                        .selectColor(selectedColor);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 0.1.w),
                                    height: 3.5.h,
                                    width: 3.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(int.parse(
                                          item.value!.colorchart![index])),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      // height: 12,
                                      width: 1.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: dashboardController
                                                    .selectedProductColorList
                                                    .value ==
                                                item.value!.colorchart![index]
                                            // .contains(dashboardController
                                            //     .productColorList[index])
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          dashboardController.selectedProductColorList.isEmpty
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.h, bottom: 1.h),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomText(
                                        text:
                                            StringConstants.pleaseSelectAColor,
                                        fontSize: 2,
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstants.errorColor,
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  height: Responsive.isDesktop(context)
                                      ? 1.h
                                      : 0.7.h,
                                ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 1.h,
                    // ),
                    FittedBox(
                      child: CustomText(
                        text: StringConstants.selectSize,
                        color: ColorConstants.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: Responsive.isDesktop(context)
                            ? 3
                            : Responsive.isTablet(context)
                                ? 7
                                : 10,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          SizedBox(
                            height: 4.h,
                            width: item.value!.sizechart!.length * 6.w,
                            child: ListView.builder(
                              itemCount: item.value!.sizechart!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                String size = item.value!.sizechart![index];

                                bool isSelected = dashboardController
                                        .selectedProductSize.value ==
                                    size;
                                return GestureDetector(
                                  // splashColor: Colors.transparent,
                                  onTap: () {
                                    dashboardController.selectSize(size);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: isSelected
                                          ? ColorConstants.primary
                                          : ColorConstants.whiteColor,
                                      border: Border.all(
                                        color: isSelected
                                            ? ColorConstants.primary
                                            : ColorConstants.lightGrayColor,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(right: 1.w),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: CustomText(
                                        text: size,
                                        fontSize: 3,
                                        fontWeight: FontWeight.w600,
                                        color: isSelected
                                            ? ColorConstants.whiteColor
                                            : ColorConstants.blackColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          dashboardController.selectedProductSize.isEmpty
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.h, bottom: 1.h),
                                  child: const Align(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      text: StringConstants.pleaseSelectASize,
                                      fontSize: 2,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.errorColor,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 1.h,
                                ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 1.h,
                    // ),
                    SizedBox(
                      width: Responsive.isDesktop(context) ? 26.w : 50.w,
                      height: Responsive.isDesktop(context) ? 6.h : 5.8.h,
                      child: PrimaryButton(
                        label: StringConstants.addToCart,
                        btnColor: ColorConstants.primary,
                        fontSize: Responsive.isDesktop(context)
                            ? 4.sp
                            : Responsive.isTablet(context)
                                ? 7.sp
                                : 10.sp,
                        height: Responsive.isDesktop(context) ? 6.h : 6.h,
                        fontWeight: FontWeight.w400,
                        // isSelected: true,
                        action: () {
                          dashboardController.selectedProductSize.isNotEmpty &&
                                  dashboardController
                                      .selectedProductColorList.isNotEmpty
                              ? {
                                  dashboardController.addToCart(
                                      dashboardController
                                          .productOnClickId.value!.sId
                                          .toString(),
                                      dashboardController.selectedProductSize
                                          .toString()),
                                  Get.snackbar(StringConstants.addedToCart,
                                      StringConstants.productAddedToCart,
                                      snackPosition: SnackPosition.TOP),
                                }
                              : {
                                  Get.snackbar(
                                    "Select all values",
                                    ("Please select Color and Size"),
                                  )
                                };
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
