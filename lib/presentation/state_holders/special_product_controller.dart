import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/models/popular_product_model.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class SpecialProductController extends GetxController{
  bool _getSpecialProductInProgress = false;
  String _errorMessage='';

  ProductModel _specialProductModel= ProductModel();
  
  bool get getSpecialProductInProgress=> _getSpecialProductInProgress;
  String get getErrorMessage=>_errorMessage;
  ProductModel get getSpecialProductModel=> _specialProductModel;

  
  Future<bool> getSpecialProduct()async{
    _getSpecialProductInProgress = true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.listProductByRemarks('special'));
    _getSpecialProductInProgress=false;
    if(response.isSuccess){
      _specialProductModel=ProductModel.fromJson(response.responseJson?? {} );
      update();
      return true;
    }else{
      _errorMessage='Special product fetch failed! Try again.';
      update();
      return false;
    }
  }
  
  
  
  
}