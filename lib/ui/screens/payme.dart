import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("UzPay Payment"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            UzPay.doPayment(
              context,
              amount: 5000,
              paymentSystem: PaymentSystem.Payme,
              paymentParams: paymentParams,
              browserType: BrowserType.External,
            );
          },
          child: const Text("Pay Now"),
        ),
      ),
    );
  }
}
