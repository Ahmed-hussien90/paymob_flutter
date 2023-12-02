import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:paymob/network/dio_helper.dart';
import 'package:paymob/utils/constants.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingState());
    DioHelper.postDataDio(
        url: Constants.getAuthToken,
        data: {"api_key": Constants.paymentApiKey}).then((value) {
      Constants.paymentFirstToken = value.data["token"];
      print("paymentFirstToken : ${Constants.paymentFirstToken}");
      emit(PaymentAuthSuccessState());
    }).catchError((err) {
      print(err);
      emit(PaymentAuthErrorState());
    });
  }

  Future<void> getOrderId({required String price}) async {
    emit(PaymentOrderIdLoadingState());
    DioHelper.postDataDio(url: Constants.getOrder, data: {
      "auth_token": Constants.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items":[]
    }).then((value) {
      Constants.paymentOrderId = value.data["id"].toString();
      print("paymentOrderId : ${Constants.paymentOrderId}");
      getPaymentRequest(price: price);
      emit(PaymentOrderIdSuccessState());
    }).catchError((err) {
      print(err);
      emit(PaymentOrderIdErrorState());
    });
  }

  Future<void> getPaymentRequest({required String price}) async {
    emit(PaymentRequestLoadingState());
    DioHelper.postDataDio(url: Constants.getPaymentId, data: {
      "auth_token": Constants.paymentFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": Constants.paymentOrderId,
      "billing_data": {
        "apartment": "803",
        "email": "claudette09@exa.com",
        "floor": "42",
        "first_name": "Clifford",
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": "+86(8)9135210487",
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": "Nicolas",
        "state": "Utah"
      },
      "currency": "EGP",
      "integration_id": Constants.integrationIdCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      Constants.finalToken = value.data["token"];
      print("finalToken : ${Constants.finalToken}");
      emit(PaymentRequestSuccessState());
    }).catchError((err) {
      print(err);
      emit(PaymentRequestErrorState());
    });
  }

  Future<void> getRefCode() async {
    emit(PaymentRefCodeLoadingState());
    DioHelper.postDataDio(url: Constants.getRefCode, data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR"
        },
        "payment_token": Constants.finalToken
    }).then((value) {
      Constants.refCode = value.data["id"].toString();
      print("refCode : ${Constants.refCode}");
      emit(PaymentRefCodeSuccessState());
    }).catchError((err) {
      print(err);
      emit(PaymentRefCodeErrorState());
    });
  }
}
