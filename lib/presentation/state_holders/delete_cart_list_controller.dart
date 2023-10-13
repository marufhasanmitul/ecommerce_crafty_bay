import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class DeleteCartListController extends GetxController{

  Future<bool> getDeleteCartListIem(int id)async{
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.deleteCartListUrl(id));

    if(response.isSuccess){
      update();
      return true;
    }else{
      return false;
    }


  }






}