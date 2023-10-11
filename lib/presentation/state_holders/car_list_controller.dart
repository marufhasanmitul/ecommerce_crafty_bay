import 'package:ecommerce_crafty_bay/data/models/car_list_data.dart';
import 'package:ecommerce_crafty_bay/data/models/cart_list_model.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class CartListController extends GetxController{

  double _totalPrice = 0;

  bool _cartListProgress=false;
  String _message='';

  CartListModel _cartListModel = CartListModel();

  CartListModel get getCartListModel=>_cartListModel;

  String get message=>_message;


  double get getTotalPrice=>_totalPrice;



  bool get getCartInProgress =>_cartListProgress;


  Future<bool> getCartList()async{
    _cartListProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.getCartListUrl);
    _cartListProgress=false;

    if(response.isSuccess){
      _cartListModel=CartListModel.fromJson(response.responseJson ?? {});
      _calculateTotalPrice();
      update();
      return true;
    }else{
      _message="Cart List Data Fetch Failed";
      update();
      return false;
    }


  }


  void changeItem(int cartId, int noOfItems) {
    _cartListModel.data?.firstWhere((cartData) => cartData.id == cartId).numberOfItems = noOfItems;
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (CartData data in _cartListModel.data ?? []) {
      _totalPrice += (data.numberOfItems * 200  );
    }
    update();
  }




}