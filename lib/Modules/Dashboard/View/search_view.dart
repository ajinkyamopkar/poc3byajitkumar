import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/responsive.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/constant_textfeild.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                text: StringConstants.cart,
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
            left: 5.w, right: 5.w, bottom: 2.h, top: kIsWeb ? 3.h : 0.h),
        child: Column(
          children: [
            ConstantTextfeild(
              controller: dashboardController.searchController,
              onChanged: (value) {
                if (value.isEmpty) {
                  dashboardController.clearSearchResults();
                } else {
                  dashboardController.searchProducts(value);
                }
              },
              hintText: StringConstants.search,
              fontSize: Responsive.isDesktop(context)
                  ? 3.5
                  : Responsive.isTablet(context)
                      ? 8
                      : 11,
              hintTextColor: ColorConstants.greyColor,
              prefixIcon: Icon(
                Icons.search_sharp,
                color: ColorConstants.blackColor,
                size: Responsive.isTablet(context)
                    ? 2.sp
                    : Responsive.isDesktop(context)
                        ? 3.5.sp
                        : 14.sp,
              ),
            ),
            Obx(
              () => dashboardController.isSearching.value
                  ? const Center(child: Text("Loading"))
                  : dashboardController.searchResults.isEmpty
                      ? recentSearchs(context)
                      : Expanded(
                          child: SizedBox(
                            // height: 50.h,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount:
                                  dashboardController.searchResults.length,
                              itemBuilder: (context, index) {
                                var item =
                                    dashboardController.searchResults[index];
                                return ListTile(
                                  contentPadding: const EdgeInsets.all(8),
                                  title: Text(item['name']),
                                  subtitle: Text('Price: \$${item['price']}'),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(2.w),
                                    child: Image.network(
                                        ApiEndPoints.baseImageUrl +
                                            item['image'][0].toString()),
                                  ),
                                  onTap: () {
                                    dashboardController
                                        .setProductOnClick(index);

                                    Get.toNamed(AppRoutes.productDetailPage);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recentSearchs(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: StringConstants.recent,
                  color: ColorConstants.text,
                  fontSize: Responsive.isDesktop(context) ? 5 : 14,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () => dashboardController.recentSearch.clear(),
                  child: CustomText(
                    text: StringConstants.clearAll,
                    color: ColorConstants.primary,
                    fontSize: Responsive.isDesktop(context) ? 5 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                itemCount: dashboardController.recentSearch.length,
                itemBuilder: (context, index) {
                  String productId =
                      dashboardController.recentSearch.keys.elementAt(index);
                  String productName =
                      dashboardController.recentSearch.values.elementAt(index);

                  return ListTile(
                    title: CustomText(
                      text: productName,
                      fontSize: Responsive.isDesktop(context) ? 5 : 12,
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        dashboardController.recentSearch.remove(productId);
                      },
                      child: const Icon(Icons.highlight_remove_outlined),
                    ),
                    onTap: () {
                      dashboardController
                          .setProductOnClickFromRecentSearch(productId);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
