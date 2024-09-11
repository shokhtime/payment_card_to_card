import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:uzpay/enums.dart';
import 'package:uzpay/objects.dart';
import 'package:uzpay/uzpay.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var transactionId = DateTime.now().microsecondsSinceEpoch.toString();
    var paymentParams = Params(
      paymeParams: PaymeParams(
        transactionParam: transactionId,
        merchantId: '6443d473096a61fb42c216af',
        headerTitle: "Payme tizimi orqali to'lash",
      ),
    );

    void pay() async {
      try {
        final response = await UzPay.doPayment(
          context,
          amount: 50,
          paymentSystem: PaymentSystem.Payme,
          paymentParams: paymentParams,
          browserType: BrowserType.External,
          externalBrowserMenuItem: ChromeSafariBrowserMenuItem(
            id: 1,
            label: "Dasturchi haqida",
            onClick: (url, title) {
              print("URL: $url");
              print("TITLE: $title");
            },
          ),
        );
        print("RESPONSE: $response");
      } catch (e) {
        print("ERROR:$e");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("UzPay Payment"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: pay,
          child: const Text("Pay Now"),
        ),
      ),
    );
  }
}
