import 'dart:async';


import 'package:ecommerce_crafty_bay/data/models/create_wish_list_model.dart';
import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class CreateWishListController extends GetxController{


  bool _createWishInProgress=false;
  String _message='';
  CreateWishListModel _createWishListModel=CreateWishListModel();
  bool get createWishInProgress =>_createWishInProgress;
  String get message => _message;

  Future<bool> createWishList(int id)async{
    _createWishInProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.createWishList(id));

    if(response.isSuccess){
      _createWishInProgress=false;
      update();
      _createWishListModel=CreateWishListModel.fromJson(response.responseJson??{});
      return true;
    }else{
      return false;
    }
  }


}