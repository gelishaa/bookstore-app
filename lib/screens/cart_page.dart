import 'package:flutter/material.dart';
import 'package:lab3/components/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
          'Cart',
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
                    const SizedBox(height: 20),
                    
                    const CartItemCard(
                      imageUrl: 'assets/images/book2.png', 
                      category: 'Novel',
                      title: 'Tuesday Mooney\nTalks to Ghosts',
                      author: 'Kate Racculia',
                      price: '\$33.00',
                      quantity: 1,
                    ),
                    const SizedBox(height: 16),
                    
                    const CartItemCard(
                      imageUrl: 'assets/images/book3.png', 
                      category: 'Adult Narrative',
                      title: 'Hello, Dream',
                      author: 'Cristina Camerena, Lady Desatia',
                      price: '\$17.00',
                      quantity: 1,
                    ),
                    
                    const SizedBox(height: 40),

                    const Text(
                      'Order Summary',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    _buildSummaryRow('Subtotal', '\$50.00', isBold: false),
                    const SizedBox(height: 12),
                    _buildSummaryRow('Shipping', '\$10.00', isBold: false),
                    const SizedBox(height: 16),
                    
                    const Divider(color: Colors.black54, thickness: 1),
                    
                    const SizedBox(height: 16),
                    _buildSummaryRow('Total', '\$60.00', isBold: true),
                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: CustomButton
                            (     
                              text: 'Proceed to Checkout',
                              onPressed: () {
                              },
                            ),
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

  Widget _buildSummaryRow(String label, String value, {required bool isBold}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: isBold ? 18 : 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: isBold ? 18 : 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
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

class CartItemCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String author;
  final String price;
  final int quantity;

  const CartItemCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.author,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140, 
      decoration: BoxDecoration(
        color: const Color(0xFF151515), 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                      const Icon(Icons.close, color: Colors.white, size: 18),
                    ],
                  ),
                  const SizedBox(height: 4),
                  
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  
                  Text(
                    author,
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const Spacer(),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _buildQtyButton(Icons.remove),
                          const SizedBox(width: 10),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          _buildQtyButton(Icons.add),
                        ],
                      ),
                      
                      Text(
                        price,
                        style: const TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyButton(IconData icon) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, size: 16, color: Colors.black),
    );
  }
}