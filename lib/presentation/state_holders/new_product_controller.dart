import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/models/popular_product_model.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class NewProductController extends GetxController{
  bool _getNewProductInProgress = false;
  String _errorMessage='';

  ProductModel _newProductModel= ProductModel();
  
  bool get getNewProductInProgress=> _getNewProductInProgress;
  String get getErrorMessage=>_errorMessage;
  ProductModel get getNewProductModel=> _newProductModel;

  
  Future<bool> getNewProduct()async{
    _getNewProductInProgress = true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.listProductByRemarks('new'));
    _getNewProductInProgress=false;
    if(response.isSuccess){
      _newProductModel=ProductModel.fromJson(response.responseJson?? {} );
      update();
      return true;
    }else{
      _errorMessage='New product fetch failed! Try again.';
      update();
      return false;
    }
  }
  
  
  
  
}