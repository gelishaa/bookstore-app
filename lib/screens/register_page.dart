import 'package:flutter/material.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Register',
          style: TextStyle(
            fontFamily: 'OpenSans', 
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80), 
              
              const Text(
                'Please fill your details to signup.',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16, 
                  color: Colors.black87
                ),
              ),
              
              const SizedBox(height: 35), 
              
              const CustomTextField(hintText: 'Username'),
              const SizedBox(height: 16), 
              
              const CustomTextField(hintText: 'Email'),
              const SizedBox(height: 16),
              
              const CustomTextField(hintText: 'Password', isObscure: true),
              const SizedBox(height: 16),
              
              const CustomTextField(hintText: 'Confirm Password', isObscure: true),
              const SizedBox(height: 40), 

              SizedBox(
                width: double.infinity,
                height: 55, 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A1A1A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'OpenSans', 
                      color: Colors.white, 
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              
              const Spacer(), 
              
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already a member? ',
                      style: TextStyle(
                        fontFamily: 'OpenSans', 
                        color: Colors.black87, 
                        fontSize: 14
                      ),
                      children: [
                        TextSpan(
                          text: 'SignIn',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}