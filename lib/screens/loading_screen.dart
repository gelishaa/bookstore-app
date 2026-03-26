import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5F5F5), 
        child: Center(
          
          child: Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A1A), 
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "un",
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.w300, 
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}