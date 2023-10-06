import 'package:ecommerce_crafty_bay/data/models/catagory_model.dart';
import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class HomeCategoryController extends GetxController{
  bool _getHomeCategoryProgress=false;
  String _message='';

  CategoryModel _categoryModel = CategoryModel();

  CategoryModel get getCategory=>_categoryModel;

  String get message=>_message;

  bool get getHomeCategoryInProgress =>_getHomeCategoryProgress;


  Future<bool> getHomeCategory()async{
    _getHomeCategoryProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.categoryList);
    _getHomeCategoryProgress=false;

    if(response.isSuccess){
      _categoryModel=CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _message="Category List Data Fetch Failed";
      update();
      return false;
    }


  }



}