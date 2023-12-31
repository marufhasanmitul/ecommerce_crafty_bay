import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/models/product_details_data.dart';
import 'package:ecommerce_crafty_bay/data/models/product_details_model.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class ProductDetailsController extends GetxController{
  bool _getProductDetailsInProgress = false;
  ProductDetailsData _productDetailsData= ProductDetailsData();
  ProductDetailsModel _detailsModel=ProductDetailsModel();
  String _errorMessage='';
   List<String>  _availableColors = [];
   List<String>  _availableSize = [];



  List<String> get availableColors => _availableColors;
  List<String> get availableSize => _availableSize;
  bool get getProductDetailsInProgress=> _getProductDetailsInProgress;
  String get getErrorMessage=>_errorMessage;

  ProductDetailsData get getProductDetails=> _productDetailsData;
  ProductDetailsModel get getProductModel=> _detailsModel;


  Future<bool> getProduct(int id)async{
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress=false;

    if(response.isSuccess){

      _detailsModel=ProductDetailsModel.fromJson(response.responseJson??{});


      _productDetailsData=ProductDetailsModel.fromJson(response.responseJson??{}).data!.first;

      _convertStringToColor(_productDetailsData.color??'');
      _convertStringToSize(_productDetailsData.size??'');
      update();


      return true;
    }else{
      _errorMessage='Empty Product';
      update();
      return false;
    }


  }



  void _convertStringToSize(String sizes){
    _availableSize =sizes.split(',');
  }

  void _convertStringToColor(String color){
    _availableColors=color.split(',');

  }







}