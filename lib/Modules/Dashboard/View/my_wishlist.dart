import 'dart:developer';

import 'package:e_commerce_app/Modules/Dashboard/Widgets/web_navbar.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/asset_constant.dart';
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

class WishlistView extends StatefulWidget {
  WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    _dashboardController.fetchFav();
    _dashboardController.allFavGrid();
    super.initState();
  }

  final DashboardController _dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    log("fav grid : ${_dashboardController.favGridView}");
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: !kIsWeb
          ? AppBar(
              scrolledUnderElevation: 0.0,
              toolbarHeight: 8.h,
              backgroundColor: ColorConstants.whiteColor,
              leadingWidth: 16.5.w,
              title: const CustomText(
                text: StringConstants.myWishlist,
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
              ),
              centerTitle: true,
              leading: Container(
                margin: EdgeInsets.only(left: 5.6.w),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorConstants.lightGrayColor, width: 1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: const EdgeInsets.all(1),
                  iconSize: 21.sp,
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
      body: Column(
        children: [
          if (kIsWeb) const WebNavBar(),
          Container(
            height: Responsive.isDesktop(context) ? 8.h : 7.2.h,
            padding: EdgeInsets.only(
                top: 1.2.h, bottom: 1.2.h, left: 3.w, right: 3.w),
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(
                width: Responsive.isDesktop(context) ? 8.w : 30.w,
                padding: EdgeInsets.only(
                  right: 2.w,
                ),
                child: Obx(
                  () => PrimaryButton(
                    btnColor:
                        _dashboardController.selectedCategory.value == (-1)
                            ? ColorConstants.primary
                            : ColorConstants.whiteColor,
                    textColor:
                        _dashboardController.selectedCategory.value == (-1)
                            ? ColorConstants.whiteColor
                            : ColorConstants.blackColor,
                    label: StringConstants.all,
                    action: () {
                      _dashboardController.selectedCategory.value = (-1);
                      _dashboardController.allFavGrid();
                    },
                    fontSize: Responsive.isDesktop(context) ? 3.sp : 10.sp,
                    fontWeight: FontWeight.w400,
                    shape: true,
                    borderColor: ColorConstants.lightGrayColor,
                    borderWidth: 1,
                  ),
                ),
              ),
              SizedBox(
                width: _dashboardController.categoryData.length *
                    (Responsive.isDesktop(context) ? 12.w : 35.w),
                // padding: EdgeInsets.only(top: 1.2.h, bottom: 1.2.h),
                child: ListView.builder(
                    itemCount: _dashboardController.categoryData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Container(
                          height: Responsive.isDesktop(context) ? 8.h : 3.h,
                          padding: EdgeInsets.only(right: 2.w),
                          child: PrimaryButton(
                            btnColor:
                                _dashboardController.selectedCategory.value ==
                                        index
                                    ? ColorConstants.primary
                                    : ColorConstants.whiteColor,
                            textColor:
                                _dashboardController.selectedCategory.value ==
                                        index
                                    ? ColorConstants.whiteColor
                                    : ColorConstants.blackColor,
                            label:
                                _dashboardController.categoryData[index].name!,
                            action: () {
                              _dashboardController.selectedCategory.value =
                                  index;
                              _dashboardController
                                      .showSelectedCategoryProduct.value =
                                  _dashboardController
                                      .categoryData[_dashboardController
                                          .selectedCategory.value]
                                      .id!
                                      .toString();

                              _dashboardController.updateFavGrid();
                            },
                            fontSize:
                                Responsive.isDesktop(context) ? 3.sp : 10.sp,
                            fontWeight: FontWeight.w400,
                            shape: true,
                            borderColor: ColorConstants.lightGrayColor,
                            borderWidth: 1,
                          ),
                        ),
                      );
                    }),
              ),
            ]),
          ),
          Obx(() => grid(context)),
        ],
      ),
    );
  }

  Widget grid(context) {
    _dashboardController.favGridView();
    log("fav grid : ${_dashboardController.favGridView}");

    return _dashboardController.filteredFavGridView.isEmpty
        ? SizedBox(
            child: CustomText(
              text: "No wishlist Data",
              fontSize: Responsive.isDesktop(context) ? 8 : 12,
            ),
          )
        : Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: SizedBox(
              width: Responsive.isDesktop(context)
                  ? 80.w
                  : Responsive.isTablet(context)
                      ? 85.w
                      : 100.w,
              height: Responsive.isDesktop(context)
                  ? 80.h
                  : Responsive.isTablet(context)
                      ? 50.h
                      : kIsWeb
                          ? 50.h
                          : 80.h,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 840),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        Responsive.isMobile(context) ? 250 : 385,
                    mainAxisExtent: Responsive.isMobile(context)
                        ? kIsWeb
                            ? 285
                            : 200
                        : 500,
                    crossAxisSpacing: Responsive.isDesktop(context)
                        ? 4.w
                        : Responsive.isTablet(context)
                            ? 7.5.w
                            : 12.w,
                    mainAxisSpacing: Responsive.isMobile(context) ? 2.h : 1.h,
                    childAspectRatio:
                        Responsive.isDesktop(context) ? 0.60 : 0.72,
                  ),
                  itemCount: _dashboardController.filteredFavGridView.length,
                  itemBuilder: (context, index) {
                    log("index : $index");
                    return GestureDetector(
                      onTap: () {
                        _dashboardController.setProductOnClickWishlist(index);
                        Get.toNamed(AppRoutes.productDetailPage);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                    height: Responsive.isDesktop(context)
                                        ? 30.h
                                        : Responsive.isTablet(context)
                                            ? 25.h
                                            : 15.h,
                                    fit: BoxFit.fill,
                                    width: Responsive.isDesktop(context)
                                        ? 30.h
                                        : Responsive.isTablet(context)
                                            ? 28.h
                                            : 19.h,
                                    image: _dashboardController
                                                .filteredFavGridView[index]
                                                .productId
                                                ?.image?[0] !=
                                            null
                                        ? NetworkImage(
                                            ApiEndPoints.baseImageUrl +
                                                _dashboardController
                                                    .filteredFavGridView[index]
                                                    .productId!
                                                    .image![0])
                                        : const AssetImage(
                                            AssetConstant.productOneImage)),
                              ),
                              Container(
                                width:
                                    Responsive.isDesktop(context) ? 3.w : 8.6.w,
                                height: 4.4.h,
                                margin: const EdgeInsets.only(right: 8, top: 8),
                                decoration: BoxDecoration(
                                  color: ColorConstants.whiteColor
                                      .withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(1),
                                  iconSize: 22,
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: ColorConstants.primary,
                                  ),
                                  onPressed: () async {
                                    log("product id wishlist : ${_dashboardController.filteredFavGridView[index].productId?.sId.toString()}");
                                    log("category id wishlist : ${_dashboardController.filteredFavGridView[index].categoryId?.sId.toString()}");
                                    await _dashboardController.likeProduct(
                                        _dashboardController
                                            .filteredFavGridView[index]
                                            .productId!
                                            .sId
                                            .toString(),
                                        _dashboardController
                                            .filteredFavGridView[index]
                                            .categoryId!
                                            .sId
                                            .toString());

                                    await _dashboardController.fetchFav();
                                    // _dashboardController.showSelectedCategoryProduct.value != (-1) ?
                                    _dashboardController
                                                .selectedCategory.value ==
                                            (-1)
                                        ? _dashboardController.allFavGrid()
                                        : _dashboardController.updateFavGrid();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Responsive.isDesktop(context)
                                    ? 10.w
                                    : Responsive.isTablet(context)
                                        ? 15.w
                                        : 25.w,
                                child: Column(
                                  children: [
                                    CustomText(
                                      text: _dashboardController
                                          .filteredFavGridView[index]
                                          .productId!
                                          .name
                                          .toString(),
                                      fontSize: Responsive.isDesktop(context)
                                          ? 3.5
                                          : Responsive.isTablet(context)
                                              ? 7.5
                                              : 10,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: ColorConstants.starColor,
                                    size: Responsive.isDesktop(context)
                                        ? 24
                                        : Responsive.isTablet(context)
                                            ? 21
                                            : 15,
                                  ),
                                  SizedBox(
                                    width: 0.5.w,
                                  ),
                                  CustomText(
                                    text: _dashboardController
                                        .filteredFavGridView[index]
                                        .productId!
                                        .rating
                                        .toString(),
                                    fontSize: Responsive.isDesktop(context)
                                        ? 3.5
                                        : Responsive.isTablet(context)
                                            ? 7.5
                                            : 10,
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstants.greyColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 0.4.h,
                          ),
                          CustomText(
                            text:
                                "\$ ${_dashboardController.filteredFavGridView[index].productId?.price.toString()}",
                            fontSize: Responsive.isDesktop(context)
                                ? 3.5
                                : Responsive.isTablet(context)
                                    ? 7.5
                                    : 10,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.blackColor,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
    // );
  }
}
