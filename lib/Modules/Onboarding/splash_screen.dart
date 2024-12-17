import 'dart:async';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/asset_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navNewScreen();
    super.initState();
  }

  navNewScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      var isSignedIn = GetStorage().read('token') ?? "";
      if (isSignedIn != "") {
        kIsWeb
            ? Get.offNamed(AppRoutes.dashBoardPage)
            : Get.offNamed(AppRoutes.bottomNavBarPage);
      } else {
        Get.offNamed(AppRoutes.loginView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetConstant.splashImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
