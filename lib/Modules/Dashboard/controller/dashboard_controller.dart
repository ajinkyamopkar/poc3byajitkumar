import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce_app/Data/Api/api_manager.dart';
import 'package:e_commerce_app/Modules/Dashboard/Model/carousal_model.dart';
// import 'package:e_commerce_app/Modules/Dashboard/Model/cart_model.dart'
//     as model_cart;
import 'package:e_commerce_app/Modules/Dashboard/Model/cart_model.dart';
import 'package:e_commerce_app/Modules/Dashboard/Model/category_model.dart';
import 'package:e_commerce_app/Modules/Dashboard/Model/coupon_model.dart';
import 'package:e_commerce_app/Modules/Dashboard/Model/fav_model.dart';
import 'package:e_commerce_app/Modules/Dashboard/Model/product_model.dart';
import 'package:e_commerce_app/Modules/Dashboard/Model/sales_category_model.dart';
import 'package:e_commerce_app/Modules/Dashboard/Model/search_model.dart';
import 'package:e_commerce_app/Modules/Dashboard/Model/verify_coupon_model.dart';
import 'package:e_commerce_app/Routes/app_routes.dart';
import 'package:e_commerce_app/Utils/Constants/asset_constant.dart';
import 'package:e_commerce_app/Utils/Constants/string_constant.dart';
import 'package:e_commerce_app/Utils/Widgets/api_endpoints.dart';
import 'package:e_commerce_app/Utils/Widgets/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  var gender = 'Male'.obs;
  final RxString selectedCountryCode = '+1'.obs;
  RxBool showAllImages = false.obs;
  RxInt activePage = 0.obs;
  var selectedIndex = 0.obs;
  var currentPage = 0.obs;

  var selectedCategory = (-1).obs;
  var showSelectedCategoryProduct = "".obs;
  var selectedSalesCategory = (-1).obs;
  var showSelectedProduct = "".obs;
  var selectedOnClickCategoryId = "".obs;
  var productOnClickId = Rx<ProductData?>(null);
  var searchOnClick = Rx<SearchData?>(null);
  var selectedCategoryName = "".obs;

  var hours = 2.obs;
  var minutes = 0.obs;
  var seconds = 0.obs;
  List<CategoryData> categoryData = [];
  List<ProductData> productData = [];
  List<FavData> favData = [];
  RxMap<String, String> recentSearch = <String, String>{}.obs;

  var carousalData = <CarousalData>[].obs;
  var couponData = <CouponData>[].obs;
  // var cartModelData = <model_cart.Data>[].obs;
  var verifyCouponData = <VerifyCouponData>[].obs;
  var salesCategoryData = <SalesCategoryData>[].obs;
  RxMap<String, RxBool> likedProducts = <String, RxBool>{}.obs;
  List isProductFav = [].obs;

  late Timer timer;
  List cartData = [].obs;
  List cartTotalData = [].obs;
  RxInt itemQuantity = 1.obs;

  RxBool isCartLoading = true.obs;

  PageController pageController = PageController();
  RxList<String> productClothImages = [
    AssetConstant.productOneImage,
    AssetConstant.productTwoImage,
    AssetConstant.productThreeImage,
    AssetConstant.productTwoImage,
    AssetConstant.productThreeImage,
    AssetConstant.productTwoImage,
  ].obs;
  RxList<String> productSizeList = ["S", "M", "L", "XL", "XXL", "XXXL"].obs;
  RxString selectedProductSize = "M".obs;
  changeActivePage(int index) {
    activePage.value = index;
    pageController.jumpToPage(index);
  }

  RxString selectedCoupon = ''.obs;

  final TextEditingController searchController = TextEditingController();
  RxBool isSearching = false.obs;
  RxBool fromSearch = false.obs;
  RxList searchResults = [].obs;
  @override
  void onInit() {
    startTimer();
    fetchCarousal();
    fetchCategory();
    fetchProduct();
    // fetchOrder();
    // fetchPastOrder();
    fetchCartDetails();
    fetchFav();
    fetchSalesCategory();
    fetchCoupon();
    super.onInit();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void selectSize(String size) {
    if (selectedProductSize.value == size) {
      selectedProductSize.value = "";
    } else {
      selectedProductSize.value = size;
    }
  }

  RxList<String> productColorList = [
    "0xff60442f",
    "0xff9a8070",
    "0xff432e1f",
    "0xff57575b",
  ].obs;

  var selectedProductColorList = "".obs;
  RxList<dynamic> selectedOnClickCategory = [].obs;
  RxList<FavData> filteredFavGridView = <FavData>[].obs;
  RxList<ProductData> filteredGridView = <ProductData>[].obs;
  RxList<ProductData> categoryGrid = <ProductData>[].obs;
  RxList<FavData> favGridView = <FavData>[].obs;

  void setCoupon(String coupon) {
    selectedCoupon.value = coupon;
  }

  void initializeFilteredGridView() {
    filteredGridView.clear();

    for (var product in productData) {
      filteredGridView.add(product);
    }
  }

  void allFavGrid() {
    if (filteredFavGridView.isNotEmpty) {
      filteredFavGridView.clear();
    }
    for (var fav in favGridView) {
      // if (showSelectedCategoryProduct.value == fav.categoryId?.sId.toString()) {
      filteredFavGridView.add(fav);
      if (kDebugMode) {
        log("grid products: $fav");
      }
      // }
    }
  }

  void byCategeory(String categoryId) {
    categoryGrid.clear();

    for (var product in productData) {
      if (product.categoryId!.sId.toString() == categoryId) {
        categoryGrid.add(product);
        if (kDebugMode) {
          log("list of clicked product: ${product.categoryId!.name}");
        }
      }
    }
  }

  void updateFavGrid() {
    filteredFavGridView.clear();
    for (var fav in favGridView) {
      if (showSelectedCategoryProduct.value == fav.categoryId?.sId.toString()) {
        filteredFavGridView.add(fav);
        if (kDebugMode) {
          log("grid products: $fav");
        }
      }
    }
  }

  void updateGrid() {
    filteredGridView.clear();
    for (var product in productData) {
      if (showSelectedProduct.value == product.salecategoryId?.sId.toString()) {
        filteredGridView.add(product);
        if (kDebugMode) {
          log("grid products: $product");
        }
      }
    }
  }

  void predefineColor(String color) {
    selectedProductColorList.value = color;
  }

  void selectColor(String color) {
    if (selectedProductColorList.value == color) {
      selectedProductColorList.value = "";
    } else {
      selectedProductColorList.value = "";
      selectedProductColorList.value = color;
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else if (minutes.value > 0) {
        minutes.value--;
        seconds.value = 59;
      } else if (hours.value > 0) {
        hours.value--;
        minutes.value = 59;
        seconds.value = 59;
      } else {
        timer.cancel();
      }
    });
  }

  void setProductOnClick(var index) {
    for (var i = 0; i < productData.length; i++) {
      if (productData[i].sId == searchResults[index]['_id']) {
        productOnClickId.value = productData[i];
        recentSearch[productData[i].sId!] = productData[i].name!;

        break;
      }
    }
  }

  void setProductOnClickFromRecentSearch(String productId) {
    for (var i = 0; i < productData.length; i++) {
      if (productData[i].sId == productId) {
        productOnClickId.value = productData[i];

        Get.toNamed(AppRoutes.productDetailPage);
        break;
      }
    }
  }

  void setProductOnClickWishlist(var index) {
    for (var i = 0; i < productData.length; i++) {
      if (productData[i].sId == filteredFavGridView[index].productId?.sId) {
        productOnClickId.value = productData[i];

        break;
      }
    }
  }

  Future<void> fetchCategory() async {
    var headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    };

    final response = await http.get(
        Uri.parse(
            ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getCategory),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> jsonData = jsonResponse['data'];
        categoryData =
            jsonData.map((item) => CategoryData.fromJson(item)).toList();
        log("Category is fetched $categoryData");
      }
    } catch (e) {
      log("Error: ${response.statusCode}, Body: ${e.toString()}");
    }
  }

  Future<void> fetchProduct() async {
    var headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    };

    final response = await http.get(
        Uri.parse(
            ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getproducts),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> jsonData = jsonResponse['data'];
        productData =
            jsonData.map((item) => ProductData.fromJson(item)).toList();

        initializeFilteredGridView();
      }
    } catch (e) {
      log("Error: ${response.statusCode}, Body: ${e.toString()}");
    }
  }

  Future<void> fetchCarousal() async {
    var headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    };

    final response = await http.get(
        Uri.parse(
            ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getCarousal),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> jsonData = jsonResponse['data'];
        carousalData.value =
            jsonData.map((item) => CarousalData.fromJson(item)).toList();
      }
    } catch (e) {
      log("Error: ${response.statusCode}, Body: ${e.toString()}");
    }
  }

  Future<void> fetchSalesCategory() async {
    var headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    };

    final response = await http.get(
        Uri.parse(
            ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getSalesCategory),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        // salesCategoryData.insert(0, CategoryModel(name: 'All', sId: 'all')) ;
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> jsonData = jsonResponse['data'];
        salesCategoryData.value =
            jsonData.map((item) => SalesCategoryData.fromJson(item)).toList();
      }
    } catch (e) {
      log("Error: ${response.statusCode}, Body: ${e.toString()}");
    }
  }

  Future<void> fetchCoupon() async {
    var headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    };

    final response = await http.get(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getCoupon),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> jsonData = jsonResponse['data'];
        couponData.value =
            jsonData.map((item) => CouponData.fromJson(item)).toList();
      }
    } catch (e) {
      log("Error: ${response.statusCode}, Body: ${e.toString()}");
    }
  }

  Future<void> verifyCoupon(
      String couponCode, int subtotal, int discount, int deliveryfee) async {
    String url =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.verifycoupon}';

    final data = {
      "coupen_code": couponCode,
      "subtotal": subtotal,
      "discount": discount,
      "deliveryfee": deliveryfee
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${GetStorage().read('token')}',
          "Content-Type": "application/json"
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['data'] != null) {
          VerifyCouponData couponData =
              VerifyCouponData.fromJson(jsonResponse['data']);

          verifyCouponData.clear();
          verifyCouponData.add(couponData);
        } else {
          Get.snackbar(StringConstants.error, StringConstants.noDataFound);
        }
      } else {
        Get.snackbar(
            StringConstants.error, StringConstants.failedToVerifyCoupon);
      }
    } catch (e) {
      log("Error verify coupon: $e");
    }
  }

  Future<void> searchProducts(String searchText) async {
    try {
      isSearching(true);
      var url =
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.getSearchProduct}';
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
        body: jsonEncode({"searchtext": searchText}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        searchResults.assignAll(jsonResponse['data']);
      } else {
        Get.snackbar(
            StringConstants.error, StringConstants.failedToSearchProducts);
      }
    } catch (e) {
      log('Error: $e');
    } finally {
      isSearching(false);
    }
  }

  void clearSearchResults() {
    searchResults.clear();
    isSearching.value = false;
  }

  Future<void> likeProduct(String productId, String categoryId) async {
    final body = {
      "product_id": productId,
      "category_id": categoryId,
    };

    try {
      final response = await http.post(
        Uri.parse(
            '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.addFavourite}'),
        headers: {
          'Authorization': 'Bearer ${GetStorage().read('token')}',
          "Content-Type": "application/json"
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        likedProducts[productId]?.value = true;
        var responseData = jsonDecode(response.body);

        if (isProductFav.isNotEmpty && !isProductFav.contains(productId)) {
          isProductFav.add(productId);
        } else if (isProductFav.isNotEmpty &&
            isProductFav.contains(productId)) {
          isProductFav.remove(productId);
        } else {
          isProductFav.add(productId);
        }
        Get.snackbar(StringConstants.wishlistUpdated, responseData["message"]);
      } else {
        Get.snackbar(StringConstants.wishlistFailedToUpdate,
            StringConstants.failedToLike);
      }
    } catch (e) {
      Get.snackbar(StringConstants.errorLikingProduct, "$e");
    }
  }

  Future<void> fetchFav() async {
    var headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    };

    final response = await http.get(
        Uri.parse(
            ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getfavourite),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> jsonData = jsonResponse['data'];
        favGridView.value =
            jsonData.map((item) => FavData.fromJson(item)).toList();
        for (var favItem in favGridView) {
          if (!isProductFav.contains(favItem.productId?.sId.toString())) {
            isProductFav.add(favItem.productId?.sId.toString());
          }
        }
      }
    } catch (e) {
      log("Error: ${response.statusCode}, Body: ${e.toString()}");
    }
  }

  Future<void> addToCart(String productId, String size) async {
    String url = '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.addcart}';

    final data = {"product_id": productId, "size": size};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${GetStorage().read('token')}',
          "Content-Type": "application/json"
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        Get.snackbar(
            StringConstants.cartUpdated, StringConstants.productAddedToCart);
      } else {
        Get.snackbar(
            StringConstants.cartUpdated, StringConstants.productAddedToCart);
      }
    } catch (e) {
      log("Error Adding to cart: $e");
    }
  }

  Future<void> addQuantity(int quantity, String id) async {
    final data = {"qty": quantity, "id": id};

    log('Sending data: $data');

    try {
      final response = await http.post(
        Uri.parse(
            '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.addQty}'),
        headers: {
          'Authorization': 'Bearer ${GetStorage().read('token')}',
          "Content-Type": "application/json"
        },
        body: json.encode(data),
      );

      log('Response: ${response.body}');
      log('Status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        fetchCartDetails();
        log("Product Quantity Updated successfully");
      } else {
        log("Failed to Add Quantity");
      }
    } catch (e) {
      log("Error Adding Quantity to cart: $e");
    }
  }

  Future<void> removeProduct(String productId) async {
    final data = {
      "id": productId,
    };

    log('Sending data: $data');

    try {
      final url = Uri.parse(
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.removeProduct}');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${GetStorage().read('token')}',
          "Content-Type": "application/json"
        },
        body: json.encode(data),
      );

      log('headers ${response.headers}');

      log('Response: ${response.body}'); // Log the response body
      log('Status code: ${response.statusCode}'); // Log the status code

      if (response.statusCode == 200) {
        log("Removed From Cart successfully");
      } else {
        log("Failed to Remove from cart");
      }
    } catch (e) {
      log("Error Removing From Cart: $e");
    }
  }

  Future<void> fetchCartDetails() async {
    String url = '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.getCart}';

    final headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        CartModel cartModel = CartModel.fromJson(data);
        cartData.assignAll(
            cartModel.data!.product!.map((e) => e.toJson()).toList());

        cartTotalData.assignAll([cartModel.toJson()]);

        isCartLoading.value = false;
      }
    } catch (e) {
      log("Body: ${e.toString()}");
    }
  }

  Future<void> chekout(String cartId) async {
    final data = {
      "cartid": cartId,
    };
    ApiManager apiManager = ApiManager();
    try {
      var response =
          apiManager.post(ApiEndPoints.authEndpoints.chekoutCart, data);
      Get.snackbar("Order is Placed", response.toString());
      log('Sending data for checkout: ${response.toString()}');
    } catch (e) {
      log("error in response of Order : ${e.toString()}");
    }
  }

  Future<void> checkoutCart(String cartId) async {
    final data = {
      "cartid": cartId,
    };
    log('Sending data: $cartId');

    try {
      final url = Uri.parse(
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.chekoutCart}');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${GetStorage().read('token')}',
          "Content-Type": "application/json"
        },
        body: json.encode(data),
      );

      log('headers ${response.headers}');

      log('Response: ${response.body}'); // Log the response body
      log('Status code: ${response.statusCode}'); // Log the status code

      if (response.statusCode == 200) {
        var msg = jsonDecode(response.body);
        // msg['']
        var msg2 = msg["message"];
        log("msg2 = $msg2");
        Get.snackbar("Order is Placed", msg);
        log("Removed From Cart successfully");
      } else {
        log("Failed to Remove from cart");
      }
    } catch (e) {
      log("Error Removing From Cart: $e");
    }
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }
}
