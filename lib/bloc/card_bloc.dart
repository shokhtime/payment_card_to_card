import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payme_app/bloc/card_event.dart';
import 'package:uuid/uuid.dart';
part 'card_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<CardToCardPaymentEvent>(paymentCardToCard);
  }

  Future<void> paymentCardToCard(
    CardToCardPaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    String transactionID = const Uuid().v4();
    emit(PaymentInitial());
    if (event.amount > 0) {
      emit(PaymentSuccess(transactionID));
    } else {
      emit(PaymentFailure("Iltimos to'lov summasini kiriting"));
    }
  }
}
