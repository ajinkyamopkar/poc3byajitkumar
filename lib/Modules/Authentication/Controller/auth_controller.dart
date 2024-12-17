import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:e_commerce_app/Modules/Dashboard/controller/dashboard_controller.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/color_constant.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http_parser/http_parser.dart';

class AuthController extends GetxController {
  final DashboardController _dashboardController =
      Get.put(DashboardController());
  var rememberMe = false.obs;
  var isObscured = true.obs;

  RxBool signedIn = false.obs;

  var profileImage = Rxn<File>(null);

  var selectedDropdownItem = StringConstants.select.obs;
  final storage = GetStorage();

  // ignore: non_constant_identifier_names
  String? fcm_token = '';

  var genderDropdownValues = const [
    StringConstants.male,
    StringConstants.female,
    StringConstants.other
  ];
  final ImagePicker _picker = ImagePicker();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }

  @override
  void onInit() {
    super.onInit();
    // _getFcmToken();
  }

  // isLoggedIn() {
  //   var isSignedIn = GetStorage().read('token') ?? '';
  //   if (isSignedIn != "") {
  //     Get.offNamed(AppRoutes.bottomNavBarPage);
  //   }
  //   // else {
  //   //   Get.offNamed(AppRoutes.loginView);
  //   // }
  // }

  // void isLoggedIn() {
  //   if (GetStorage().read('token') != "") {
  //     log("get token : ${GetStorage().read('token')}");
  //     // _dashboardController.selectedIndex.value = 0;
  //     Get.offNamed(AppRoutes.bottomNavBarPage);
  //   } else {
  //     log("get else token : ${GetStorage().read('token')}");
  //     // _dashboardController.selectedIndex.value = 0;
  //     Get.offNamed(AppRoutes.bottomNavBarPage);
  //   }
  // }

  // Future<void> _getFcmToken() async {
  //   try {
  //     fcm_token = kIsWeb
  //         ? 'Default_Fcm_Token'
  //         : await FirebaseMessaging.instance.getToken();
  //     GetStorage().write('fcm_token', fcm_token);
  //   } catch (e) {
  //     fcm_token = 'Default_Fcm_Token';
  //   }
  // }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  // Future fetchLoginApi() async {
  //   var body = {
  //     "username": nameController.text.trim(),
  //     "password": passwordController.text.trim(),
  //     "expiresInMins": 30,
  //   };
  //   final response =
  //       await _dio.post('https://dummyjson.com/auth/login', data: body);
  //   try {
  //     if (response.statusCode == 200) {
  //       log('response from api code ${response.data}');
  //       var accessToken = response.data['accessToken'];
  //       box.write('accessToken', accessToken);
  //       Get.offAllNamed(AppRoutes.homeScreen);
  //     } else {
  //       log('Error with StatusCode ${response.statusCode}');
  //     }
  //   } catch (error, stacktrace) {
  //     log('Exception occurred: $error stackTrace: $stacktrace');
  //   }
  // }

  Future<void> forgotPassword() async {
    try {
      var url =
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.forgotPassword}';
      // "${Uri.parse(ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.forgotPassword})";
      Map<String, dynamic> body = {
        "oldpassword": passwordController.text,
        "newpassword": confirmPasswordController.text,
        "email": emailController.text
      };
      Map<String, dynamic> headers = {
        'Authorization': 'Bearer ${GetStorage().read('token')}'
      };
      log("url of the reset password $url");
      log("body of the reset password $body");

      final response = await dio.Dio()
          .post(url, data: body, options: dio.Options(headers: headers));
      log("response of the reset password $response");
      Get.toNamed(
        AppRoutes.loginView,
      );

      if (response.statusCode == 200) {
        log("Password has been reset ${response}");
        Get.toNamed(
          AppRoutes.loginView,
        );
      } else {
        log("Failed reset password : ${response}");
      }
    } catch (e) {
      log("failde reset password and error catched : $e");
    }
  }

  Future<void> loginWithEmail() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'fcm_token': fcm_token,
        'login_type': 'Email',
      };

      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        GetStorage().write('user_data', json);
        GetStorage().write('token', json['token']);
        _dashboardController.fetchFav();
        _dashboardController.fetchSalesCategory();
        _dashboardController.fetchCoupon();
        _dashboardController.fetchCarousal();
        _dashboardController.fetchCategory();
        _dashboardController.fetchProduct();

        Get.snackbar(
            StringConstants.success, StringConstants.userLoggedInSuccessfully,
            snackPosition: SnackPosition.TOP,
            backgroundColor: ColorConstants.successColor,
            colorText: ColorConstants.text);
        emailController.clear();
        passwordController.clear();
        kIsWeb
            ? Get.offNamed(AppRoutes.dashBoardPage)
            : Get.offNamed(AppRoutes.bottomNavBarPage);
      } else {
        throw jsonDecode(response.body)["message"] ??
            StringConstants.unknownErrorOccured;
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text(StringConstants.errorInLogin),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  Future<void> registerUser() async {
    final url =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.registerEmail}';

    final fcmToken = storage.read('fcm_token');

    try {
      // Initialize Dio
      dio.Dio dioInstance = dio.Dio();

      // Create FormData to send multipart request
      dio.FormData formData = dio.FormData.fromMap({
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'number': phoneController.text,
        'gender': _dashboardController.gender.value,
        'address': addressController.text,
        'fcm_token': "",
        'login_type': 'Email',
      });

      // Check if profile image is provided
      if (profileImage.value != null) {
        var imageFile = File(profileImage.value!.path);
        var imageExtension = imageFile.path.split('.').last.toLowerCase();
        String mimeType;

        // Determine the MIME type
        if (imageExtension == 'jpg' || imageExtension == 'jpeg') {
          mimeType = 'image/jpeg';
        } else if (imageExtension == 'png') {
          mimeType = 'image/png';
        } else {
          throw Exception(StringConstants.unsupportedImageFormat);
        }

        // Add the image file to the FormData
        formData.files.add(
          MapEntry(
            'image',
            await dio.MultipartFile.fromFile(
              imageFile.path,
              contentType: MediaType.parse(mimeType),
            ),
          ),
        );
      }

      // Send POST request
      dio.Response response = await dioInstance.post(url, data: formData);

      // Check the response status code
      if (response.statusCode == 200) {
        final data = response.data;

        Get.snackbar(
          StringConstants.success,
          StringConstants.userRegisteredSuccessfully,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorConstants.greyColor,
          colorText: ColorConstants.whiteColor,
        );

        GetStorage().write('user_data', data);
        storage.write('token', data['token']);

        Get.toNamed(AppRoutes.loginView);
      } else {
        Get.snackbar(
          StringConstants.error,
          "${StringConstants.failedToRegisterUser}: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorConstants.errorColor,
          colorText: ColorConstants.whiteColor,
        );
        throw Exception(StringConstants.failedToRegisterUser);
      }
    } catch (e) {
      Get.snackbar(
        StringConstants.error,
        "${StringConstants.errorDuringRegistration}: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorConstants.errorColor,
        colorText: ColorConstants.whiteColor,
      );
      throw Exception(StringConstants.failedToRegisterUser);
    }
  }
}
