import 'package:ecommerce_crafty_bay/data/models/popular_product_model.dart';
import 'package:ecommerce_crafty_bay/data/models/review_product_model.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class ReviewProductController extends GetxController{
  bool _reviewProductInProgress = false;
  ReviewProductModel _reviewProductModelModel= ReviewProductModel();
  String _errorMessage='';


  bool get getReviewProductInProgress=> _reviewProductInProgress;
  String get getErrorMessage=>_errorMessage;
  ReviewProductModel get reviewProduct=> _reviewProductModelModel;


  Future<bool> getReviewProduct(int id)async{
    _reviewProductInProgress = true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.listReviewByProduct(id));
    _reviewProductInProgress=false;
    if(response.isSuccess){
      _reviewProductModelModel=ReviewProductModel.fromJson(response.responseJson??{});
      update();
      return true;
    }else{
      _errorMessage=' Product Review fetch failed! Try again.';
      update();
      return false;
    }


  }


}