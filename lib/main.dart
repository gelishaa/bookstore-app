import 'package:flutter/material.dart';
import 'package:lab3/screens/checkout_page.dart';
import 'package:lab3/screens/login_page.dart';
import 'package:lab3/screens/register_page.dart';
import 'screens/loading_screen.dart'; 
import 'screens/product_page.dart'; 
import 'screens/tab_bar.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoadingScreen(), 
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const CustomBottomNavigationBar(selectedIndex: 0), 
        '/cart': (context) => const CustomBottomNavigationBar(selectedIndex: 1),
        '/account': (context) => const CustomBottomNavigationBar(selectedIndex: 2),
        '/product': (context) => const ProductScreen(),
        '/checkout': (context) => const CheckoutPage(),
      },
    );
  }
}