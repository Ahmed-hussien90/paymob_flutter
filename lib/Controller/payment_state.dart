part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class PaymentAuthLoadingState extends PaymentState{}
class PaymentAuthSuccessState extends PaymentState{}
class PaymentAuthErrorState extends PaymentState{}

class PaymentOrderIdLoadingState extends PaymentState{}
class PaymentOrderIdSuccessState extends PaymentState{}
class PaymentOrderIdErrorState extends PaymentState{}

class PaymentRequestLoadingState extends PaymentState{}
class PaymentRequestSuccessState extends PaymentState{}
class PaymentRequestErrorState extends PaymentState{}

class PaymentRefCodeLoadingState extends PaymentState{}
class PaymentRefCodeSuccessState extends PaymentState{}
class PaymentRefCodeErrorState extends PaymentState{}

