
import 'package:ecommerce_crafty_bay/data/models/invoice_create_response_model.dart';
import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class CreateInvoiceController extends GetxController{
  bool _inProgress=false;
  String _message="";

  InvoiceCreateResponseModel _invoiceCreateResponseModel=InvoiceCreateResponseModel();

  InvoiceCreateData? get invoiceCreateData=>_invoiceCreateResponseModel.data?.first;

  bool get inProgress=>_inProgress;

  String get message=>_message;

  Future<bool> createInvoice()async {
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.invoiceCreateUrl);
    _inProgress = false;
    update();
    if(response.isSuccess){
      _invoiceCreateResponseModel=InvoiceCreateResponseModel.fromJson(response.responseJson!);
     return true;
    }else{
      _message="Payment Method failed";
      return false;
    }








  }






}