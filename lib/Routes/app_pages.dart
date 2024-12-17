import 'package:e_commerce_app/Modules/Authentication/View/forgot_password.dart';
import 'package:e_commerce_app/Modules/Authentication/View/login_view.dart';
import 'package:e_commerce_app/Modules/Authentication/View/reset_password.dart';
import 'package:e_commerce_app/Modules/Authentication/View/signup_view.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/cart_web.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/category_products.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/coupon_view.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/dashboard_view.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/edit_profile.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/flex.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/my_cart_view.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/my_wishlist.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/order_placed.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/product_detail.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/profile.dart';
import 'package:e_commerce_app/Modules/Dashboard/View/search_view.dart';
import 'package:e_commerce_app/Modules/Dashboard/Widgets/bottom_nav_bar.dart';
import 'package:e_commerce_app/Modules/Onboarding/splash_screen.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Transition transition = Transition.cupertino;

class AppPages {
  ///
  /// Define Initial Screen Route
  ///
  static const INITIAL = AppRoutes.splashScreen;

  ///
  /// Static list of routes with Page name, Route name & Transition
  ///+
  static final routes = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
        transition: transition),
    GetPage(
        name: AppRoutes.loginView,
        page: () => LoginView(),
        transition: transition),
    GetPage(
        name: AppRoutes.signupView,
        page: () => SignupView(),
        transition: transition),
    GetPage(
        name: AppRoutes.forgotPassword,
        page: () => ForgotPasswordView(),
        transition: transition),
    GetPage(
        name: AppRoutes.resetPage,
        page: () => ResetPasswordView(),
        transition: transition),
    GetPage(
        name: AppRoutes.editProfilePage,
        page: () => EditProfile(),
        transition: transition),
    GetPage(
        name: AppRoutes.bottomNavBarPage,
        page: () => const Navbar(),
        transition: transition),
    GetPage(
        name: AppRoutes.dashBoardPage,
        page: () => DashboardView(),
        transition: transition),
    GetPage(
        name: AppRoutes.profilePage,
        page: () => const ProfileView(),
        transition: transition),
    GetPage(
        name: AppRoutes.myWishlistPage,
        page: () => WishlistView(),
        transition: transition),
    GetPage(
        name: AppRoutes.productDetailPage,
        page: () => ProductDetailView(),
        transition: transition),
    GetPage(
        name: AppRoutes.couponPage,
        page: () => const CouponView(),
        transition: transition),
    GetPage(
        name: AppRoutes.searchPage,
        page: () => SearchView(),
        transition: transition),
    GetPage(
        name: AppRoutes.myCartPage,
        page: () => MyCartView(),
        transition: transition),
    GetPage(
        name: AppRoutes.orderPlacedPage,
        page: () => const OrderPlaced(),
        transition: transition),
    GetPage(
        name: AppRoutes.categoryProductsPage,
        page: () => const CategoryProducts(),
        transition: transition),
    GetPage(
        name: AppRoutes.cartWebPage,
        page: () => CartWeb(),
        transition: transition),
  ];
}
