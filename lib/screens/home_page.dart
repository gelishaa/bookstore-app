import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), 
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 30.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Happy Reading!',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 30),

                      _buildSectionHeader('Top Books', 'see more'),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 290, 
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            BookCard(
                              imageUrl: 'assets/images/book.png', 
                              category: 'Classics',
                              title: 'The Picture of Dorian Gray',
                              author: 'Oscar Wilde',
                              price: '\$25.00',
                            ),
                            SizedBox(width: 16),
                            BookCard(
                              imageUrl: 'assets/images/book4.png', 
                              category: 'Classics',
                              title: 'The Catcher in the Rye',
                              author: 'J.D. Salinger',
                              price: '\$30.00',
                            ),
                            SizedBox(width: 20), 
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 30),

                      _buildSectionHeader('Latest Books', 'see more'),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 290,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            BookCard(
                              imageUrl: 'assets/images/book5.png',
                              category: 'Young adult',
                              title: 'Nine Liars',
                              author: 'Maureen Johnson',
                              price: '\$16.00',
                            ),
                            SizedBox(width: 16),
                            BookCard(
                              imageUrl: 'assets/images/book6.png', 
                              category: 'Fantasy',
                              title: 'Sorrow and Starlight',
                              author: 'Caroline Peckham, Susanne Valenti',
                              price: '\$30.00',
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ],
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
                  _buildNavItem(Icons.home, 'Home', true), 
                  _buildNavItem(Icons.shopping_cart, 'Cart', false),
                  _buildNavItem(Icons.account_box, 'Account', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              actionText,
              style: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ],
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

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String author;
  final String price;

  const BookCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.author,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, 
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A), 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFD4D4D4),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 100, 
                ),
              ),
            ),
          ),
          
          Expanded(
            flex: 3, 
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.grey,
                          fontSize: 10,
                        ),
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
                      const SizedBox(height: 2),
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
                    ],
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}