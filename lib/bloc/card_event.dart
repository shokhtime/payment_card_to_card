import 'package:payme_app/data/model/card.dart';

abstract class PaymentEvent {}

class CardToCardPaymentEvent extends PaymentEvent {
  final CardInfo sender;
  final CardInfo recipient;
  final double amount;

  CardToCardPaymentEvent({
    required this.sender,
    required this.recipient,
    required this.amount,
  });
}

class PaymentResetEvent extends PaymentEvent {}
