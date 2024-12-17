import 'dart:developer';

import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/asset_constant.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WishlistView extends StatefulWidget {
  WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    _dashboardController.fetchFav();
    super.initState();
  }

  final DashboardController _dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    log("fav grid : ${_dashboardController.favGridView}");
    final List<String> cartegoryWishlist = [
      "All",
      "Jacket",
      "Shirt",
      "Pant",
      "T-Shirt",
      "Specs"
    ];
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
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
            border: Border.all(color: ColorConstants.lightGrayColor, width: 1),
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
      ),
      body: Column(
        children: [
          Container(
            height: 7.2.h,
            width: _dashboardController.categoryData.length *
                (Responsive.isDesktop(context) ? 8.w : 30.w),
            padding: EdgeInsets.only(top: 1.2.h, bottom: 1.2.h),
            child: ListView.builder(
                itemCount: _dashboardController.categoryData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Container(
                      height: 3.h,
                      padding: EdgeInsets.only(right: 2.w),
                      child: PrimaryButton(
                        btnColor:
                            _dashboardController.selectedCategory.value == index
                                ? ColorConstants.primary
                                : ColorConstants.whiteColor,
                        textColor:
                            _dashboardController.selectedCategory.value == index
                                ? ColorConstants.whiteColor
                                : ColorConstants.blackColor,
                        label: _dashboardController.categoryData[index].name!,
                        action: () {
                          _dashboardController.selectedCategory.value = index;
                          _dashboardController
                                  .showSelectedCategoryProduct.value =
                              _dashboardController
                                  .categoryData[_dashboardController
                                      .selectedCategory.value]
                                  .id!
                                  .toString();

                          // _dashboardController.updateGrid();
                        },
                        fontSize: Responsive.isDesktop(context) ? 15.sp : 10.sp,
                        fontWeight: FontWeight.w400,
                        shape: true,
                        borderColor: ColorConstants.lightGrayColor,
                        borderWidth: 1,
                      ),
                    ),
                  );
                }),
          ),
          Obx(() => grid(context)),
        ],
      ),
    );
  }

  Widget grid(context) {
    _dashboardController.filteredGridView();
    log("filtered fav grid : ${_dashboardController.filteredGridView}");

    return _dashboardController.favGridView.isEmpty
        ? const SizedBox(
            child: Text("no wishlist Data"),
          )
        : Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: SizedBox(
              width: Responsive.isDesktop(context)
                  ? 70.w
                  : Responsive.isTablet(context)
                      ? 85.w
                      : 100.w,
              height: Responsive.isDesktop(context) ? 85.h : 80.h,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 840),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        Responsive.isMobile(context) ? 250 : 325,
                    mainAxisExtent: Responsive.isMobile(context) ? 200 : 500,
                    crossAxisSpacing: Responsive.isDesktop(context)
                        ? 4.w
                        : Responsive.isTablet(context)
                            ? 7.5.w
                            : 12.w,
                    childAspectRatio:
                        Responsive.isDesktop(context) ? 0.60 : 0.72,
                  ),
                  itemCount: _dashboardController.favGridView.length,
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
                                    fit: BoxFit.contain,
                                    width: Responsive.isDesktop(context)
                                        ? 30.h
                                        : Responsive.isTablet(context)
                                            ? 28.h
                                            : 19.h,
                                    image: _dashboardController
                                                .favGridView[index]
                                                .productId
                                                ?.image?[0] !=
                                            null
                                        ? NetworkImage(
                                            ApiEndPoints.baseImageUrl +
                                                _dashboardController
                                                    .favGridView[index]
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
                                    log("product id wishlist : ${_dashboardController.favGridView[index].productId?.sId.toString()}");
                                    log("category id wishlist : ${_dashboardController.favGridView[index].categoryId?.sId.toString()}");
                                    await _dashboardController.likeProduct(
                                        _dashboardController
                                            .favGridView[index].productId!.sId
                                            .toString(),
                                        _dashboardController
                                            .favGridView[index].categoryId!.sId
                                            .toString());

                                    await _dashboardController.fetchFav();
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
                                width: 25.w,
                                child: Column(
                                  children: [
                                    CustomText(
                                      text: _dashboardController
                                          .favGridView[index].productId!.name
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
                                        .favGridView[index].productId!.rating
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
                                "\$ ${_dashboardController.favGridView[index].productId?.price.toString()}",
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
