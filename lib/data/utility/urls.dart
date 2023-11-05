class Urls{
  static const String _baseUrl='https://ecom-api.teamrabbil.com/api';
  static String verifyEmail(String email) =>'$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email,String otp) =>'$_baseUrl/VerifyLogin/$email/$otp';
  static String getSlider = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String listProductByRemarks(String remarks) => '$_baseUrl/ListProductByRemark/$remarks';
  static String getProductDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static String getProductListByCategory(int productId) => '$_baseUrl/ListProductByCategory/$productId';
  static String deleteCartListUrl(int productId) => '$_baseUrl/DeleteCartList/$productId';
  static const String addToCart = '$_baseUrl/CreateCartList';
  static const String invoiceCreateUrl = '$_baseUrl/InvoiceCreate';
  static String getCartListUrl = '$_baseUrl/CartList';

  static String readProfile = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String productWishList = '$_baseUrl/ProductWishList';
  static String createWishList(int productId ) => '$_baseUrl/CreateWishList/$productId';
  static String deleteWishlistProduct(int productId) => '$_baseUrl/RemoveWishList/$productId';
  static String listReviewByProduct(int productId) => '$_baseUrl/ListReviewByProduct/$productId';
  static String createReview= '$_baseUrl/CreateProductReview';

}