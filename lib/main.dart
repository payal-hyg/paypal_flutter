import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayPal Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PaymentScreen(),
    );
  }
}
