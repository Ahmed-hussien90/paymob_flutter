import 'package:flutter/material.dart';
import 'package:paymob/view/home.dart';

import 'network/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayMob',
      home: MyHomePage(title: 'PayMob'),
    );
  }
}

