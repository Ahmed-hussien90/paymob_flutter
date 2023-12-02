import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob/view/base/refcode_dialog.dart';
import 'package:paymob/view/payment_screen.dart';

import '../Controller/payment_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthToken(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocConsumer<PaymentCubit, PaymentState>(
                  listener: (context, state) {
                if (state is PaymentRequestSuccessState) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentScreen()));
                                },
                                leading: const Icon(
                                  Icons.credit_card,
                                  color: Colors.purple,
                                ),
                                title: const Text("Pay With Visa"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return const RefCodeDialog();
                                      });
                                },
                                leading: const Icon(
                                  Icons.phone_android_rounded,
                                  color: Colors.purple,
                                ),
                                title: const Text("Pay With RefCode"),
                              ),
                            )
                          ],
                        );
                      });
                }
              }, builder: (context, state) {
                return state is PaymentOrderIdLoadingState
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        child: const Text("Process to Pay"),
                        onPressed: () {
                          context.read<PaymentCubit>().getOrderId(price: "2550");
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
