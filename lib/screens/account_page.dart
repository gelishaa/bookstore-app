import 'package:flutter/material.dart';
import 'package:lab3/components/custom_button.dart';
import '../components/text_field.dart'; 

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        title: const Text(
          'Account',
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, 
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Icon(
                      Icons.account_circle,
                      size: 130,
                      color: Color(0xFF1A1A1A),
                    ),
                    const SizedBox(height: 30),

                    const CustomTextField(hintText: 'Name:            John Doe'),
                    const SizedBox(height: 16),
                    
                    const CustomTextField(hintText: 'E-mail:            johndoe123@mail.com'),
                    const SizedBox(height: 16),
                    
                    const CustomTextField(hintText: 'Password:      ********', isObscure: true),
                    const SizedBox(height: 16),
                    
                    const CustomTextField(hintText: 'Address:         No.23, James Street, New Town'),
                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: CustomButton
                            (     
                              text: 'Edit',
                              onPressed: () {
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.black, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Log out',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: Colors.black, 
                                  fontSize: 16
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 25), 
              decoration: BoxDecoration(
                color: const Color(0xFFEDEDED), 
                border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', false),
                  _buildNavItem(Icons.shopping_cart, 'Cart', false),
                  _buildNavItem(Icons.account_box, 'Account', true), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: isActive 
              ? BoxDecoration(
                  color: const Color(0xFF1A1A1A), 
                  borderRadius: BorderRadius.circular(20),
                ) 
              : null,
          child: Icon(
            icon, 
            color: isActive ? Colors.white : Colors.black87,
            size: 26,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}