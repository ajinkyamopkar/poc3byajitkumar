import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/dashboard_view.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/my_cart_view.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/my_wishlist.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/order_placed.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/profile.dart';
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AuthController instance from GetX
    // final AuthController controller = Get.find<AuthController>();
    final DashboardController dashboardController =
        Get.find<DashboardController>();
    final List<Widget> pages = [
      DashboardView(),
      MyCartView(),
      // Get.toNamed(AppRoutes.cartPage),
      WishlistView(),
      const OrderPlaced(),
      const ProfileView(),
    ];

    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      extendBody: true,
      body: Obx(() => pages[dashboardController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () {
          return CrystalNavigationBar(
            indicatorColor: ColorConstants.whiteColor,
            marginR: EdgeInsets.only(
              left: 6.w,
              right: 6.w,
              top: 2.h,
              bottom: 2.h,
            ),
            backgroundColor: ColorConstants.navBarColor,
            borderRadius: 60,
            items: <CrystalNavigationBarItem>[
              CrystalNavigationBarItem(
                icon: Icons.home_filled,
                unselectedIcon: Icons.home_outlined,
                selectedColor: ColorConstants.navBarSelectedColor,
                unselectedColor: ColorConstants.navBarUnselectedColor,
              ),
              CrystalNavigationBarItem(
                icon: Icons.shopping_bag_outlined,
                selectedColor: ColorConstants.navBarSelectedColor,
                unselectedColor: ColorConstants.navBarUnselectedColor,
              ),
              CrystalNavigationBarItem(
                icon: Icons.favorite_rounded,
                unselectedIcon: Icons.favorite_border,
                selectedColor: ColorConstants.navBarSelectedColor,
                unselectedColor: ColorConstants.navBarUnselectedColor,
              ),
              CrystalNavigationBarItem(
                icon: Icons.message_outlined,
                selectedColor: ColorConstants.navBarSelectedColor,
                unselectedColor: ColorConstants.navBarUnselectedColor,
              ),
              CrystalNavigationBarItem(
                icon: Icons.person_pin,
                selectedColor: ColorConstants.navBarSelectedColor,
                unselectedColor: ColorConstants.navBarUnselectedColor,
              ),
            ],
            splashColor: ColorConstants.greyColor,
            currentIndex: dashboardController.selectedIndex.value,
            onTap: (index) => dashboardController.onItemTapped(index),
          );
        },
      ),
    );
  }
}
