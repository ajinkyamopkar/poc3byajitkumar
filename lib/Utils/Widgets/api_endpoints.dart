class ApiEndPoints {
  static final String baseUrl = 'http://fashionapp.idealake.com/api/';
  static final String baseImageUrl = 'http://fashionapp.idealake.com/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'user/signup';
  final String loginEmail = 'user/login';
  final String getCategory = 'category/getcategory';
  final String getproducts = 'product/getproducts';
  final String getCarousal = 'carousal/getcarousal';
  final String getSalesCategory = 'salescategory/getsalescategory';
  final String getCoupon = '/coupen/getcoupens';
  final String getSearchProduct = '/product/searchproduct';
  final String addFavourite = '/favourite/addfavourite';
  final String getfavourite = '/favourite/getfavourite';
  final String addcart = "/cart/addcart";
  final String getCart = "/cart/getcart";
  final String removeProduct = "/cart/removeproduct";
  final String addQty = "/cart/addqty";
  final String verifycoupon = "/cart/verifycoupen";
  final String getOrder = "/order/getorder";
  final String chekoutCart = "/order/checkout";
  final String forgotPassword = "user/forgotpassword";
}
