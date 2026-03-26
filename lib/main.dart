import 'package:flutter/material.dart';
import 'package:lab3/screens/account_page.dart';
import 'package:lab3/screens/cart_page.dart';
import 'package:lab3/screens/checkout_page.dart';
import 'package:lab3/screens/home_page.dart';
import 'package:lab3/screens/login_page.dart';
import 'package:lab3/screens/register_page.dart';
import 'screens/loading_screen.dart'; 
import 'screens/product_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: CheckoutPage(), 
    );
  }
}