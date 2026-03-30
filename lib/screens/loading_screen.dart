import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5F5F5), 
        child: Center(
          child: Image.asset(
            'assets/images/logo.png', 
            width: 250, 
            height: 250,
          ),
        ),
      ),
    );
  }
}