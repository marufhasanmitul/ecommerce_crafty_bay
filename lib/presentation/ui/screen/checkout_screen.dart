import 'package:ecommerce_crafty_bay/data/models/payment_method.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/web_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/create_invoice_controller.dart';
class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (controller) {
          if(controller.inProgress){
             return const Center(
               child: CircularProgressIndicator(),
             );
          }
          return ListView.separated(
              itemCount:controller.invoiceCreateData?.paymentMethod?.length?? 0 ,
              itemBuilder: (context,index){
                final PaymentMethod paymentMethod=controller.invoiceCreateData!.paymentMethod![index];
                return ListTile(
                  leading: Image.network(paymentMethod.logo?? '',width: 60,),
                  title: Text(paymentMethod.name??''),
                  onTap: (){
                    Get.off(()=> WebViewScreen(paymentUrl: paymentMethod.redirectGatewayURL!,) );
                  },
                );
              },
            separatorBuilder: (_, __) {
                return const Divider();
            },
          );
        }
      ),
    );
  }
}
