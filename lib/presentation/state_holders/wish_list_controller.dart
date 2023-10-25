
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/wish_list_product_model.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class WishListScreenController extends GetxController {
  bool _getWishListProductsInProgress = false;
  WishListProductModel _wishListProductModel = WishListProductModel();
  String _errorMessage = '';

  bool get getWishListProductsInProgress => _getWishListProductsInProgress;

  WishListProductModel get wishListProductModel => _wishListProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getWishlistProducts() async {
    _getWishListProductsInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.productWishList);
    _getWishListProductsInProgress = false;
    if (response.isSuccess) {
      _wishListProductModel =
          WishListProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'WishList product fetch failed! Try again.';
      update();
      return false;
    }
  }
}