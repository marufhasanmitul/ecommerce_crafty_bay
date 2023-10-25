
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class DeleteWishListProductController extends GetxController {
  String _message = '';

  String get message => _message;

  Future<bool> deleteWishlistProduct(int productId) async {
    final NetworkResponse response = await NetworkCaller()
        .getRequest(Urls.deleteWishlistProduct(productId));
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Delete wish list product failed!';
      return false;
    }
  }
}