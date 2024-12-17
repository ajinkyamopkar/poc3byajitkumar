import 'package:e_commerce_app/Modules/Dashboard/Widgets/web_navbar.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.background,
        body: kIsWeb
            ? products(context)
            : SafeArea(
                child: products(context),
              ));
  }

  Widget products(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Column(children: [
        kIsWeb
            ? const WebNavBar()
            : SizedBox(
                width: 0.w,
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !kIsWeb
                ? IconButton(
                    padding: const EdgeInsets.all(1),
                    iconSize: 21.sp,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorConstants.blackColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  )
                : SizedBox(
                    height: 0.h,
                  ),
            CustomText(
              text: dashboardController.selectedCategoryName.value.toString(),
              color: ColorConstants.primaryTextColor,
              fontSize: Responsive.isDesktop(context) ? 6 : 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              width: 4.w,
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        dashboardController.categoryGrid.isEmpty
            ? const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: StringConstants.noDataFound,
                  ),
                ),
              )
            : Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: Responsive.isMobile(context)
                        ? 250
                        : Responsive.isMobile(context)
                            ? 250
                            : 325,
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
                    childAspectRatio:
                        Responsive.isDesktop(context) ? 0.60 : 0.72,
                  ),
                  itemCount: dashboardController.categoryGrid.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.productDetailPage);

                        dashboardController.productOnClickId.value =
                            dashboardController.categoryGrid[index];
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
                                          dashboardController
                                              .categoryGrid[index].image![0]),
                                ),
                              ),
                              Obx(
                                () => Container(
                                  width: Responsive.isDesktop(context)
                                      ? 3.w
                                      : 8.6.w,
                                  height: 4.4.h,
                                  margin:
                                      const EdgeInsets.only(right: 8, top: 8),
                                  decoration: BoxDecoration(
                                    color: ColorConstants.whiteColor
                                        .withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                      padding: const EdgeInsets.all(1),
                                      iconSize: 22,
                                      icon: dashboardController.isProductFav
                                              .contains(dashboardController
                                                  .categoryGrid[index].sId
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
                                                .categoryGrid[index].sId
                                                .toString(),
                                            dashboardController
                                                .categoryGrid[index]
                                                .categoryId!
                                                .sId
                                                .toString());
                                        dashboardController.fetchFav();
                                      }),
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
                                      text: dashboardController
                                          .categoryGrid[index].name!,
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
                                    text: dashboardController
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
                                "\$ ${dashboardController.categoryGrid[index].price.toString()}",
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
              )
      ]),
    );
  }
}
