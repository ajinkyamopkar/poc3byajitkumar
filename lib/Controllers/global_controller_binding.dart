import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

import '../Modules/Authentication/Controller/auth_controller.dart';
import 'network_connectivity_controller.dart';

///
/// Initial Controller Binding
///
class GlobalControllerBindings extends Bindings {
  @override
  void dependencies() {
    // login controller initialisation
    Get.put(
      AuthController(),
    );
    // dashboard controller initialisation
    Get.put(
      DashboardController(),
    );

    // Get.put(
    //   DashboardView(),
    // );

    // login controller initialisation
    Get.put(
      NetworkConnectivityController(),
    );
  }
}
