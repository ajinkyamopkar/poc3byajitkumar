import 'package:e_commerce_app/Controllers/global_controller_binding.dart';
import 'package:e_commerce_app/Routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        context,
        orientation,
        deviceType,
      ) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-commerce Project',
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
          initialBinding: GlobalControllerBindings(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
    );
  }
}
