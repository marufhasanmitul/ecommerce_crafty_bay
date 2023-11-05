import 'dart:async';
import 'package:ecommerce_crafty_bay/data/models/create_wish_list_model.dart';
import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class CreateReviewController extends GetxController{


  bool _createReviewInProgress=false;
  String _message='';
  bool get createReviewInProgress =>_createReviewInProgress;
  String get message => _message;

  Future<bool> createReview(String description,int productId,int rating)async{
    _createReviewInProgress=true;
    update();
    final NetworkResponse response= await NetworkCaller().postRequest(
        Urls.createReview,
        {
          "description":description,
          "product_id":productId,
          "rating":rating
        },


    );

    if(response.isSuccess){
      _createReviewInProgress=false;

      update();
      return true;
    }else{
      return false;
    }
  }


}