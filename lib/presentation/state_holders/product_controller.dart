import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/models/popular_product_model.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class ProductController extends GetxController{
  bool _getPopularProductInProgress = false;
  String _errorMessage='';

  PopularProductModel _popularProductModel= PopularProductModel();
  
  bool get getPopularProductInProgress=> _getPopularProductInProgress;
  String get getErrorMessage=>_errorMessage;
  PopularProductModel get getPopularProductModel=> _popularProductModel;

  
  Future<bool> getPopularProduct()async{
    _getPopularProductInProgress = true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.listProductByRemarks('popular'));
    _getPopularProductInProgress=false;
    if(response.isSuccess){
      _popularProductModel=PopularProductModel.fromJson(response.responseJson?? {} );
      update();
      return true;
    }else{
      _errorMessage='Popular product fetch failed! Try again.';
      update();
      return false;
    }
  }
  
  
  
  
}