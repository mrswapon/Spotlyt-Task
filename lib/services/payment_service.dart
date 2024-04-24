import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'dart:math';


class PaymentService {
  final String _apiKey = "535d93d718fc411f8b34b2817ae48009";
  final String _privateKey = "d8e48c91ae0f485e941145f380f0d10c";
  final String _siteCode = "LRA-LRA-001";
  final String cancelUrl = 'http://test.i-pay.co.za/responsetest.php';
  final String errorUrl = 'http://test.i-pay.co.za/responsetest.php';
  final String successUrl = 'http://test.i-pay.co.za/responsetest.php';
  final String notifyUrl = 'http://test.i-pay.co.za/responsetest.php';

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

  String generateRequestHash(double amount) {
    String siteCode = _siteCode;
    String countryCode = 'ZA';
    String currencyCode = 'ZAR';
    String transactionReference = 'Ref';
    String bankReference = 'Ref';
    String cancelUrl = 'http://test.i-pay.co.za/responsetest.php';
    String errorUrl = 'http://test.i-pay.co.za/responsetest.php';
    String successUrl = 'http://test.i-pay.co.za/responsetest.php';
    String notifyUrl = 'http://test.i-pay.co.za/responsetest.php';
    String privateKey = _privateKey;
    bool isTest = false;

    String inputString = (siteCode +
        countryCode +
        currencyCode +
        amount.toString() +
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
    String hash = generateRequestHash(amount);
    String ref = generateRef();

    Map<String, dynamic> data = {
      "countryCode": "ZA",
      "amount": amount.toString(),
      "transactionReference": "Ref",
      "bankReference": "Ref",
      "cancelUrl": cancelUrl,
      "currencyCode": "ZAR",
      "errorUrl": cancelUrl,
      "isTest": false,
      "notifyUrl": notifyUrl,
      "siteCode": _siteCode,
      "Optional1": "",
      "Optional2": "",
      "Optional3": "",
      "successUrl": successUrl,
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
