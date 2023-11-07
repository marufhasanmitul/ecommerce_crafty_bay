import 'package:ecommerce_crafty_bay/presentation/state_holders/car_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _webViewController= WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {
          if(url.endsWith("tran_type=success")){
            navigateBack();
          }
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.paymentUrl));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body:WebViewWidget(
        controller: _webViewController,

      ) ,
    );
  }

  void navigateBack(){
    Navigator.pop(context);
    Get.snackbar('Payment Successful','Your Order has been confirmed',snackPosition: SnackPosition.BOTTOM);
    Get.find<CartListController>().getCartList();
  }
}
