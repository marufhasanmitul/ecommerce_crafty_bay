class Urls{
  static const String _baseUrl='https://craftybay.teamrabbil.com/api';
  static String verifyEmail(String email) =>'$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email,String otp) =>'$_baseUrl/VerifyLogin/$email/$otp';
  static String getSlider = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String listProductByRemarks(String remarks) => '$_baseUrl/ListProductByRemark/$remarks';
  static String getProductDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static String getProductListByCategory(int productId) => '$_baseUrl/ListProductByCategory/$productId';
  static const String addToCart = '$_baseUrl/CreateCartList';
}