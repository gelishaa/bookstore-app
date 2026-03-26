import 'package:flutter/material.dart';
import '../components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

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
          'Get Started',
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
              const SizedBox(height: 72), 
              
              const Text(
                'Please fill your details to login.',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16, 
                  color: Colors.black87
                ),
              ),
              
              const SizedBox(height: 32), 
              
              const CustomTextField(hintText: 'Username/email'),
              const SizedBox(height: 24), 
              
              CustomTextField(
                hintText: 'Password', 
                isObscure: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32), 

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
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white, 
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'forgot password?',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.black87,
                      fontSize: 14,
                      decoration: TextDecoration.underline, 
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
                      text: 'New member? ',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black87, 
                        fontSize: 14
                      ),
                      children: [
                        TextSpan(
                          text: 'Register',
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