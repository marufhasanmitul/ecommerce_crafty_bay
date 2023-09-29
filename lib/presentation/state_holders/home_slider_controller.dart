import 'package:ecommerce_crafty_bay/data/models/netowork_response.dart';
import 'package:ecommerce_crafty_bay/data/models/slider_model.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class HomeSliderController extends GetxController{
  bool _gethomeSliderProgress=false;

  SliderModel _sliderModel=SliderModel();

  SliderModel get sliderModel=>_sliderModel;

  bool get getHomeSliderInProgress =>_gethomeSliderProgress;


  Future<bool> getHomeSlider()async{
    _gethomeSliderProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.getSlider);
    _gethomeSliderProgress=false;

    if(response.isSuccess){
      _sliderModel=SliderModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      update();
      return false;
    }


  }



}