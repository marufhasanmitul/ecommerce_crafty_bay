
import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class AddToCartController extends GetxController{
  bool _addToCartInProgress=false;
  String _message="";

  bool get addToCartInProgress=>_addToCartInProgress;

  String get message=>_message;

  Future<bool> getAddToCart(int productId,String color,String size)async {
    _addToCartInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.addToCart, {
      "product_id": productId,
      "color": color,
      "size": size
    });

    _addToCartInProgress = false;
    update();
    if(response.isSuccess){
     return true;
    }else{
      _message="Add to Cart failed";
      return false;
    }








  }






}