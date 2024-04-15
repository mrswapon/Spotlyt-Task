// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/views/screens/payments/cancel_payment.dart';
import 'package:spotlyt_task/views/screens/payments/failed_payment.dart';
import 'package:spotlyt_task/views/screens/payments/success_payment.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../services/api_checker.dart';
import '../../../services/api_client.dart';
import '../../../services/api_constants.dart';

// ignore: must_be_immutable
class OzowPaymentUI extends StatefulWidget {
  String paymentLink;
  var serviceInfo;
  OzowPaymentUI({
    super.key,
    required this.paymentLink,
    required this.serviceInfo,
  });

  @override
  State<OzowPaymentUI> createState() => _OzowPaymentUIState();
}

class _OzowPaymentUIState extends State<OzowPaymentUI> {

   late WebViewController webViewController;
  getUrlQueryPrams(String url)async{
    Uri uri = Uri.parse(url);
    Map<String, String> queryParams = uri.queryParameters;
    // Print the query parameters
    print("Query Parameters: $queryParams");
    return queryParams;

  }
  
  @override
  void initState() {
    initUrl();
    
    super.initState();
  }
initUrl(){
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onUrlChange: (UrlChange change) => {
            if (change.url.toString().contains("success"))
              {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SuccessPayment(),
                  ),
                )
              }
            else if (change.url.toString().contains("error"))
              {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const FailedPayment(),
                  ),
                )
              }
            else if (change.url.toString().contains("cancel"))
                {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const CancelPayment(),
                    ),
                  )
                }
          },

          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            _isLoading.value = false;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request)async {
            debugPrint("on navigation request ${request.url}");
            if (request.url.toString().contains("success")){
              Map<String,String> data=await getUrlQueryPrams(request.url);
              submitTask(data['TransactionId']!);
              //  add backend request
            } else if (request.url.toString().contains("error")){
              //  add backend request
            } else if (request.url.toString().contains("cancel")){


              //  add backend request
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          widget.paymentLink,
        ),
      );
    
    
}

  final _isLoading =true.obs;

   submitTask(String transactionId) async {
     widget.serviceInfo['transactionId']=transactionId;

     print('=============================> ${widget.serviceInfo}');
     Response response = await ApiClient.postData(
         ApiConstants.requesterSubmitTaskEndPoint, widget.serviceInfo);
     print("============> ${response.body} and ==> ${response.statusCode}");
     if (response.statusCode == 201 || response.statusCode == 200) {
     } else {
       ApiChecker.checkApi(response);
     }
   }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (dip) async {
        if (await webViewController.canGoBack()) {
          webViewController.goBack();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(()=>
             Stack(
              children: [
                WebViewWidget(
                    controller:webViewController),
                if (_isLoading.value)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}