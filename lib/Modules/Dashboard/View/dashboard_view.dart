import 'dart:ui';

import 'package:e_commerce_app/Modules/Dashboard/Widgets/web_navbar.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/constant_textfeild.dart';
import 'package:e_commerce_app/Utils/Widgets/primary_button.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final DashboardController _dashboardController = Get.find();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 4.w, right: 4.w, bottom: 4.w, top: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                      child: Responsive.isDesktop(context)
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: StringConstants.locationText,
                                        fontSize: Responsive.isDesktop(context)
                                            ? 3
                                            : 11,
                                        fontWeight: FontWeight.w300,
                                        color: ColorConstants.primaryTextColor),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: Responsive.isTablet(context)
                                              ? 4.sp
                                              : Responsive.isDesktop(context)
                                                  ? 3.sp
                                                  : 11.sp,
                                          color: ColorConstants.primary,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        const FittedBox(
                                          child: CustomText(
                                              text: StringConstants
                                                  .newYorkUSAText,
                                              fontSize: 3.5,
                                              // Responsive.isDesktop(context)
                                              //     ? 3.2
                                              //     : 12,
                                              fontWeight: FontWeight.w500,
                                              color: ColorConstants
                                                  .primaryTextColor),
                                        ),
                                        SizedBox(
                                          width: 0.2.w,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color:
                                              ColorConstants.secondaryTextColor,
                                          size: 3.h,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 0.5.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstants.lightGrayColor,
                                      borderRadius: BorderRadius.circular(8.w)),
                                  child: Padding(
                                    padding: EdgeInsets.all(0.6.w),
                                    child: Icon(
                                      Icons.notifications,
                                      color: ColorConstants.blackColor,
                                      size: 1.5.w,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  // flex: 4,
                                  child: GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(AppRoutes.searchPage),
                                    child: ConstantTextfeild(
                                      hintText: StringConstants.search,
                                      fontSize: Responsive.isDesktop(context)
                                          ? 3
                                          : 11,
                                      hintTextColor: ColorConstants.greyColor,
                                      prefixIcon: const Icon(
                                        Icons.search_sharp,
                                        color: ColorConstants.blackColor,
                                      ),
                                      enabled: false,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 1.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorConstants.primary,
                                        borderRadius:
                                            BorderRadius.circular(8.w)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(14.0),
                                      child: Icon(
                                        Icons.sort,
                                        color: ColorConstants.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              child: CustomText(
                                                  text: StringConstants
                                                      .locationText,
                                                  fontSize: Responsive.isTablet(
                                                          context)
                                                      ? 7
                                                      : 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: ColorConstants
                                                      .primaryTextColor),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: Responsive.isTablet(
                                                          context)
                                                      ? 8.sp
                                                      : 14.sp,
                                                  color: ColorConstants.primary,
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                FittedBox(
                                                  child: CustomText(
                                                      text: StringConstants
                                                          .newYorkUSAText,
                                                      fontSize:
                                                          Responsive.isTablet(
                                                                  context)
                                                              ? 7
                                                              : 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: ColorConstants
                                                          .primaryTextColor),
                                                ),
                                                SizedBox(
                                                  width: 0.5.w,
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: ColorConstants
                                                      .secondaryTextColor,
                                                  size: 3.h,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstants.lightGrayColor,
                                          borderRadius:
                                              BorderRadius.circular(8.w)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () =>
                                              _dashboardController.fetchFav(),
                                          child: const Icon(
                                            Icons.notifications,
                                            color: ColorConstants.blackColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () =>
                                            Get.toNamed(AppRoutes.searchPage),
                                        child: ConstantTextfeild(
                                          hintText: StringConstants.search,
                                          fontSize: Responsive.isTablet(context)
                                              ? 8
                                              : 11,
                                          hintTextColor:
                                              ColorConstants.greyColor,
                                          prefixIcon: const Icon(
                                            Icons.search_sharp,
                                            color: ColorConstants.blackColor,
                                          ),
                                          enabled: false,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: ColorConstants.primary,
                                            borderRadius:
                                                BorderRadius.circular(8.w)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(14.0),
                                          child: Icon(
                                            Icons.sort,
                                            color: ColorConstants.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              if (kIsWeb) const WebNavBar(),
              SizedBox(
                height: Responsive.isDesktop(context) ? 2.h : 2.h,
              ),
              Obx(
                () => SizedBox(
                  height: Responsive.isDesktop(context)
                      ? 75.h //500
                      : Responsive.isTablet(context)
                          ? 30.h //350
                          : 22.h, //250
                  width: Responsive.isDesktop(context) ? 90.w : 100.w,
                  child: ScrollConfiguration(
                    behavior:
                        ScrollConfiguration.of(context).copyWith(dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    }),
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: _dashboardController.carousalData.length,
                        onPageChanged: (index) {
                          _dashboardController.currentPage.value = index;
                        },
                        itemBuilder: (context, index) {
                          return _bannerCard(
                              _dashboardController.carousalData[index].title,
                              _dashboardController.carousalData[index].subtitle,
                              ApiEndPoints.baseImageUrl +
                                  _dashboardController
                                      .carousalData[index].image!,
                              context);
                        }),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      _dashboardController.carousalData.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: Responsive.isDesktop(context) ? 0.5.w : 2.w,
                      height: Responsive.isDesktop(context) ? 0.5.w : 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _dashboardController.currentPage.value == index
                            ? ColorConstants.primary
                            : ColorConstants.lightGrayColor,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: CustomText(
                      text: StringConstants.category,
                      fontSize: Responsive.isDesktop(context)
                          ? 6
                          : Responsive.isTablet(context)
                              ? 9
                              : 15.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomText(
                    text: StringConstants.seeAll,
                    fontSize: Responsive.isDesktop(context)
                        ? 3.5
                        : Responsive.isTablet(context)
                            ? 9
                            : 11,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.primary,
                  ),
                ],
              ),
              // SizedBox(
              //   height: 2.h,
              // ),
              Center(
                child: SizedBox(
                  height: Responsive.isDesktop(context)
                      ? 30.h
                      : Responsive.isTablet(context)
                          ? 30.h
                          : 23.h,
                  width: _dashboardController.categoryData.length *
                      (Responsive.isDesktop(context)
                          ? 15.w
                          : Responsive.isTablet(context)
                              ? 20.w
                              : 30.w),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _dashboardController.categoryData.length,
                    itemBuilder: (context, index) {
                      var data = _dashboardController.categoryData[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.categoryProductsPage);
                          _dashboardController.selectedCategoryName.value =
                              data.name.toString();
                          _dashboardController.byCategeory(data.id.toString());
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive.isDesktop(context)
                                ? 2.w
                                : Responsive.isTablet(context)
                                    ? 3.w
                                    : 4.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                  Responsive.isDesktop(context)
                                      ? 1.5.w
                                      : Responsive.isTablet(context)
                                          ? 4.w
                                          : 4.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w),
                                  color: ColorConstants.background,
                                ),
                                child: Image.network(
                                  ApiEndPoints.baseImageUrl + data.image!,
                                  height: Responsive.isDesktop(context)
                                      ? 6.w
                                      : Responsive.isTablet(context)
                                          ? 10.w
                                          : 12.w,
                                  width: Responsive.isDesktop(context)
                                      ? 6.w
                                      : Responsive.isTablet(context)
                                          ? 10.w
                                          : 14.w,
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                  height: Responsive.isDesktop(context)
                                      ? 0.8.h
                                      : 1.5.h),
                              FittedBox(
                                child: CustomText(
                                  text: data.name!,
                                  fontSize: Responsive.isDesktop(context)
                                      ? 0.8.sp
                                      : Responsive.isTablet(context)
                                          ? 2.sp
                                          : 8.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // SizedBox(
              //   height: 1.h,
              // ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: StringConstants.flashSale,
                        fontSize: Responsive.isDesktop(context) ? 6 : 15.5,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      CustomText(
                        text: StringConstants.closingIn,
                        fontSize: Responsive.isDesktop(context) ? 3.5 : 11,
                        fontWeight: FontWeight.w400,
                        color: ColorConstants.secondaryTextColor,
                      ),
                      buildTimeContainer(
                          _dashboardController.hours.value
                              .toString()
                              .padLeft(2, '0'),
                          context),
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: CustomText(
                          text: ":",
                          fontSize: Responsive.isDesktop(context) ? 6 : 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      buildTimeContainer(
                          _dashboardController.minutes.value
                              .toString()
                              .padLeft(2, '0'),
                          context),
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: CustomText(
                          text: ":",
                          fontSize: Responsive.isDesktop(context) ? 6 : 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      buildTimeContainer(
                          _dashboardController.seconds.value
                              .toString()
                              .padLeft(2, '0'),
                          context),
                    ],
                  )),
              Container(
                height: Responsive.isDesktop(context)
                    ? 9.h
                    : Responsive.isTablet(context)
                        ? 8.w
                        : 7.2.h,
                padding: EdgeInsets.only(top: 1.2.h, bottom: 1.2.h),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      // width: Responsive.isDesktop(context) ? 8.w : 30.w,
                      padding: EdgeInsets.only(right: 2.w),
                      child: Obx(
                        () => PrimaryButton(
                          btnColor: _dashboardController
                                      .selectedSalesCategory.value ==
                                  (-1)
                              ? ColorConstants.primary
                              : ColorConstants.whiteColor,
                          textColor: _dashboardController
                                      .selectedSalesCategory.value ==
                                  (-1)
                              ? ColorConstants.whiteColor
                              : ColorConstants.blackColor,
                          label: "All",
                          action: () {
                            _dashboardController.selectedSalesCategory.value =
                                (-1);
                            _dashboardController.initializeFilteredGridView();
                          },
                          fontSize: Responsive.isDesktop(context)
                              ? 4.sp
                              : Responsive.isTablet(context)
                                  ? 5.sp
                                  : 10.sp,
                          fontWeight: FontWeight.w400,
                          shape: true,
                          borderColor: ColorConstants.lightGrayColor,
                          borderWidth: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _dashboardController.salesCategoryData.length *
                          (Responsive.isDesktop(context) ? 12.w : 30.w),
                      child: ListView.builder(
                          itemCount:
                              _dashboardController.salesCategoryData.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => Container(
                                height: 3.h,
                                padding: EdgeInsets.only(right: 2.w),
                                child: PrimaryButton(
                                  btnColor: _dashboardController
                                              .selectedSalesCategory.value ==
                                          index
                                      ? ColorConstants.primary
                                      : ColorConstants.whiteColor,
                                  textColor: _dashboardController
                                              .selectedSalesCategory.value ==
                                          index
                                      ? ColorConstants.whiteColor
                                      : ColorConstants.blackColor,
                                  label: _dashboardController
                                      .salesCategoryData[index].name!,
                                  action: () {
                                    _dashboardController
                                        .selectedSalesCategory.value = index;
                                    _dashboardController
                                            .showSelectedProduct.value =
                                        _dashboardController
                                            .salesCategoryData[
                                                _dashboardController
                                                    .selectedSalesCategory
                                                    .value]
                                            .sId!
                                            .toString();

                                    _dashboardController.updateGrid();
                                  },
                                  fontSize: Responsive.isDesktop(context)
                                      ? 4.sp
                                      : Responsive.isTablet(context)
                                          ? 5.sp
                                          : 10.sp,
                                  fontWeight: FontWeight.w400,
                                  shape: true,
                                  borderColor: ColorConstants.lightGrayColor,
                                  borderWidth: 1,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),

              // SizedBox(
              //   height: kIsWeb? 2.h : 1.h,
              // ),

              SizedBox(
                width: Responsive.isDesktop(context)
                    ? 90.w
                    : Responsive.isTablet(context)
                        ? 85.w
                        : 100.w,
                height: Responsive.isDesktop(context) ? 100.h : 90.8.h,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 840),
                  child: Obx(
                    () => GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            Responsive.isMobile(context) ? 250 : 395,
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
                        mainAxisSpacing:
                            Responsive.isMobile(context) ? 2.h : 1.h,
                        childAspectRatio:
                            Responsive.isDesktop(context) ? 0.60 : 0.72,
                      ),
                      itemCount: _dashboardController.filteredGridView.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.productDetailPage);

                            _dashboardController.productOnClickId.value =
                                _dashboardController.filteredGridView[index];
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
                                      image: NetworkImage(
                                          ApiEndPoints.baseImageUrl +
                                              _dashboardController
                                                  .filteredGridView[index]
                                                  .image![0]),
                                    ),
                                  ),
                                  Obx(
                                    () => Container(
                                      width: Responsive.isDesktop(context)
                                          ? 3.w
                                          : 8.6.w,
                                      height: 4.4.h,
                                      margin: const EdgeInsets.only(
                                          right: 8, top: 8),
                                      decoration: BoxDecoration(
                                        color: ColorConstants.whiteColor
                                            .withOpacity(0.5),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                          padding: const EdgeInsets.all(1),
                                          iconSize: 22,
                                          icon: _dashboardController
                                                  .isProductFav
                                                  .contains(_dashboardController
                                                      .filteredGridView[index]
                                                      .sId
                                                      .toString())
                                              ? const Icon(
                                                  Icons.favorite,
                                                  color: ColorConstants.primary,
                                                )
                                              : const Icon(
                                                  Icons
                                                      .favorite_outline_outlined,
                                                  color: ColorConstants.primary,
                                                ),
                                          onPressed: () {
                                            _dashboardController.likeProduct(
                                                _dashboardController
                                                    .filteredGridView[index].sId
                                                    .toString(),
                                                _dashboardController
                                                    .filteredGridView[index]
                                                    .categoryId!
                                                    .sId
                                                    .toString());
                                            _dashboardController.fetchFav();
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.8.h,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Responsive.isDesktop(context)
                                        ? 10.w
                                        : 25.w,
                                    child: Column(
                                      children: [
                                        CustomText(
                                          text: _dashboardController
                                              .filteredGridView[index].name!,
                                          fontSize:
                                              Responsive.isDesktop(context)
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
                                  if (kIsWeb)
                                    SizedBox(
                                      width: 1.w,
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
                                            .productData[index].rating
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
                                    "\$ ${_dashboardController.filteredGridView[index].price.toString()}",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _bannerCard(title, subtitle, imagePath, context) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      decoration: BoxDecoration(
        image:
            DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.lightGrayColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Responsive.isDesktop(context) ? 40.w : 40.w,
              child: CustomText(
                text: title,
                color: ColorConstants.primaryTextColor,
                fontWeight: FontWeight.w600,
                fontSize: Responsive.isDesktop(context)
                    ? 11
                    : Responsive.isTablet(context)
                        ? 13
                        : 17,
              ),
            ),
            SizedBox(
              width: Responsive.isDesktop(context) ? 40.w : 40.w,
              child: CustomText(
                text: subtitle,
                color: ColorConstants.secondaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: Responsive.isDesktop(context) ? 6 : 11,
              ),
            ),
            SizedBox(height: 2.h),
            PrimaryButton(
              label: StringConstants.shopNow,
              btnColor: ColorConstants.primary,
              height: Responsive.isDesktop(context) ? 6.h : 4.h,
              width: Responsive.isDesktop(context) ? 20.w : 30.w,
              fontWeight: FontWeight.w500,
              fontSize: Responsive.isDesktop(context) ? 3.sp : 5.sp,
            ),
          ],
        ),
      ));
}

Widget buildTimeContainer(String time, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(Responsive.isDesktop(context) ? 3 : 4),
        decoration: BoxDecoration(
          color: ColorConstants.lightGrayColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: CustomText(
          text: time,
          fontSize: Responsive.isDesktop(context) ? 4 : 10,
          fontWeight: FontWeight.w400,
          color: ColorConstants.primary,
        ),
      ),
    ],
  );
}
