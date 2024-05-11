import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'dart:math';


class PaymentService {
  final String _apiKey = "535d93d718fc411f8b34b2817ae48009";
  final String _privateKey = "d8e48c91ae0f485e941145f380f0d10c";
  final String _siteCode = "LRA-LRA-001";
   final String _cancelUrl = 'https://api.spotlyt.co.za/cancel';
  final String _errorUrl = 'https://api.spotlyt.co.za/error';
  final String _successUrl = 'https://api.spotlyt.co.za/success';
  final String _notifyUrl = 'https://api.spotlyt.co.za/notify';

  String generateRequestHashCheck(String inputString) {
    var sha = sha512.convert(utf8.encode(inputString));
    return sha.toString();
  }

  String generateRef() {
    int minLength = 10000;
    int maxLength = 900000;
    Random random = Random();
    int randomNumber = minLength + random.nextInt(maxLength - minLength + 1);

    return 'ref-$randomNumber';
  }

  String generateRequestHash(double amount,String ref) {
    String siteCode = _siteCode;
    String countryCode = 'ZA';
    String currencyCode = 'ZAR';
    String transactionReference = ref;
    String bankReference = 'Ref';
    String cancelUrl = _cancelUrl;
    String errorUrl = _errorUrl;
    String successUrl = _successUrl;
    String notifyUrl = _notifyUrl;
    String privateKey = _privateKey;
    bool isTest = false;

    String inputString = (siteCode +
        countryCode +
        currencyCode +
        amount.toStringAsFixed(2) +
        transactionReference +
        bankReference +
        cancelUrl +
        errorUrl +
        successUrl +
        notifyUrl +
        isTest.toString() +
        privateKey);

    inputString = inputString.toLowerCase();
    String calculatedHashResult = generateRequestHashCheck(inputString);
     print("Hashcheck: $calculatedHashResult");
    return calculatedHashResult;
  }

  Future<dynamic> makePaymentRequest({
    required double amount,
  }) async {
    String url = "https://api.ozow.com/postpaymentrequest";
    // String url = "https://stagingapi.ozow.com/PostPaymentRequest";

    String ref = generateRef();
    String hash = generateRequestHash(amount,ref);

    Map<String, dynamic> data = {
      "countryCode": "ZA",
      "amount": amount.toStringAsFixed(2),
      "transactionReference": ref,
      "bankReference": "Ref",
      "cancelUrl": _cancelUrl,
      "currencyCode": "ZAR",
      "errorUrl": _errorUrl,
      "isTest": false,
      "notifyUrl": _notifyUrl,
      "siteCode": _siteCode,
      "Optional1": "",
      "Optional2": "",
      "Optional3": "",
      "successUrl": _successUrl,
      "hashCheck": hash
    };

    var headers = {
      "Accept": "application/json",
      "ApiKey": _apiKey,
      "Content-Type": "application/json"
    };

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        print('Request success with status: ${response.statusCode}');
        return response.body;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Error: $e');
      return 1;
    }
  }
}
