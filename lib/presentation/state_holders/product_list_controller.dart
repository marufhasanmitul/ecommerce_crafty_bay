import 'package:ecommerce_crafty_bay/data/models/popular_product_model.dart';
import 'package:ecommerce_crafty_bay/data/models/product.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductListController extends GetxController{
  bool _productListInProgress = false;

  ProductModel _productListModel= ProductModel();
  String _errorMessage='';


  bool get getProductListInProgress=> _productListInProgress;
  String get getErrorMessage=>_errorMessage;
  ProductModel get productList=> _productListModel;


  Future<bool> getProductList(int id)async{
    _productListInProgress = true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.getProductListByCategory(id));
    _productListInProgress=false;
    if(response.isSuccess){
      _productListModel=ProductModel.fromJson(response.responseJson??{});
      update();
      return true;
    }else{
    _errorMessage=' Product List fetch failed! Try again.';
  update();
    return false;
  }


  }

void setProducts(ProductModel productModel){
  _productListModel=productModel;
  update();
}


}