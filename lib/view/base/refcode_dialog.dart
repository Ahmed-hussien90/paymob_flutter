import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob/Controller/payment_cubit.dart';

import '../../utils/constants.dart';

class RefCodeDialog extends StatelessWidget {
  const RefCodeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>PaymentCubit()..getRefCode(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Card(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Pay with this Code in Market",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple)),
                    state is PaymentRefCodeLoadingState
                        ? const CircularProgressIndicator()
                        : state is PaymentRefCodeErrorState
                            ? const Text(
                                "error while getting code",
                                style: TextStyle(color: Colors.red),
                              )
                            : Text(
                                Constants.refCode,
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              )
                  ]),
            );
          }),
    );
  }
}
