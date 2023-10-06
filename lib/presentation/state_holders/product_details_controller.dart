import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/models/product_details_data.dart';
import 'package:ecommerce_crafty_bay/data/models/product_details_model.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class ProductDetailsController extends GetxController{
  bool _getProductDetailsInProgress = false;
  ProductDetailsData _productDetailsData= ProductDetailsData();
  String _errorMessage='';
  final List<String>  _availableColors = [];



  List<String> get availableColors => _availableColors;
  bool get getProductDetailsInProgress=> _getProductDetailsInProgress;
  String get getErrorMessage=>_errorMessage;

  ProductDetailsData get getProductDetails=> _productDetailsData;


  Future<bool> getProduct(int id)async{
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress=false;
    if(response.isSuccess){
      _productDetailsData=ProductDetailsModel.fromJson(response.responseJson??{}).data!.first;

      update();


      return true;
    }else{
      _errorMessage=' Product Details fetch failed! Try again.';
      update();
      return false;
    }


  }





}