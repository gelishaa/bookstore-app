import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _selectedPaymentMethod = 2; 

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
          'Checkout',
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    
                    const Text(
                      'Delivering Address',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF151515), 
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              'No.23, James Street,\nNew Town, North\nProvince',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.5, 
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Change',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.white70, 
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 40),

                    const Text(
                      'Payment Method',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    RadioGroup<int>(
                      groupValue: _selectedPaymentMethod,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() {
                            _selectedPaymentMethod = value;
                          });
                        }
                      },
                      child: Column(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black54, 
                            ),
                            child: RadioListTile<int>(
                              contentPadding: EdgeInsets.zero, 
                              title: const Text(
                                'Credit Card',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              value: 1,
                              activeColor: Colors.black, 
                              secondary: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            ),
                          ),
                          
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black54,
                            ),
                            child: RadioListTile<int>(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Cash on Delivery',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  fontWeight: _selectedPaymentMethod == 2 ? FontWeight.bold : FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              value: 2,
                              activeColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF151515), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Pay \$60.00',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  _buildNavItem(Icons.shopping_cart, 'Cart', true),
                  _buildNavItem(Icons.account_box, 'Account', false),
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
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
            fontSize: 13,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}