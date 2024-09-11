part of "card_bloc.dart";

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentInProgress extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String transactionId;
  PaymentSuccess(this.transactionId);
}

class PaymentFailure extends PaymentState {
  final String error;
  PaymentFailure(this.error);
}
