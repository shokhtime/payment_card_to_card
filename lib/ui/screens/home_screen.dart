// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:payme_app/bloc/card_bloc.dart';
import 'package:payme_app/bloc/card_event.dart';
import 'package:payme_app/data/model/card.dart';
import 'package:payme_app/ui/widgets/textfield_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _senderCardNumberController = TextEditingController();
  final _recipientCardNumberController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          centerTitle: true,
          title: const Text('Payment App'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextfieldWidget(
                controller: _senderCardNumberController,
                labelText: "Sender Card Number",
                keyboardType: TextInputType.number,
              ),
              const Gap(10),
              TextfieldWidget(
                controller: _recipientCardNumberController,
                labelText: "Recipient Card Number",
                keyboardType: TextInputType.number,
              ),
              const Gap(10),
              TextfieldWidget(
                controller: _amountController,
                labelText: "Amount",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 100),
              BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, state) {
                  if (state is PaymentInProgress) {
                    return const CircularProgressIndicator();
                  } else if (state is PaymentSuccess) {
                    return Text(
                      textAlign: TextAlign.start,
                      'Payment Successful!\nTransaction ID: ${state.transactionId}',
                    );
                  } else if (state is PaymentFailure) {
                    return Text('Payment Failed: ${state.error}');
                  }

                  return ElevatedButton(
                    onPressed: () {
                      final senderCard = CardInfo(
                        cardNumber: _senderCardNumberController.text,
                        expiryDate: '12/24',
                        cvv: '123',
                        cardHolderName: 'Ali Mirzayev',
                      );

                      final recipientCard = CardInfo(
                        cardNumber: _recipientCardNumberController.text,
                        expiryDate: '12/25',
                        cvv: '456',
                        cardHolderName: 'Vali Qosimov',
                      );

                      final amount =
                          double.tryParse(_amountController.text) ?? 0;

                      context.read<PaymentBloc>().add(
                            CardToCardPaymentEvent(
                              sender: senderCard,
                              recipient: recipientCard,
                              amount: amount,
                            ),
                          );
                      _senderCardNumberController.clear();
                      _recipientCardNumberController.clear();
                      _amountController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(350, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
