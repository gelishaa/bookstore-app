import 'package:flutter/material.dart';
import '../components/custom_button.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Classics',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'The Picture of Dorian Gray',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 138,
                  height: 214,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/book.png'), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      _buildInfoText('Author', 'Oscar Wilde'),
                      _buildInfoText('Category', 'Classics'),
                      _buildInfoText('Rating', '4.11/5'),
                      const SizedBox(height: 10),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const [
                          Text(
                            'Pricing: ',
                            style: TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                          Text(
                            '\$25.00',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      CustomButton(
                        text: 'Add to Cart',
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Oscar Wilde’s only novel is the dreamlike story of \n a young man who sells his soul for eternal youth \nand beauty. In this celebrated work Wilde forged \na devastating portrait of the effects of evil and \ndebauchery on a young aesthete in late-19th-\ncentury England. Combining elements of the\n Gothic horror novel and decadent French fiction,\n the book centers on a striking premise: As \nDorian Gray sinks into a life of crime and gross \nsensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he \nmust keep hidden from the world. For over a century, this mesmerizing tale of horror and suspense has enjoyed wide popularity. It ranks as one of Wilde\'s most important creations and among the classic achievements of its kind.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.black,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 70,
          backgroundColor: const Color(0xFFF5F5F5),
          elevation: 0,
          selectedIndex: 0,
          onDestinationSelected: (int index) {
            if (index == 0) {
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            } else if (index == 1) {
              Navigator.pushNamed(context, '/cart');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/account');
            }
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_filled, color: Colors.black),
              selectedIcon: Icon(Icons.home_filled, color: Colors.white),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline, color: Colors.black),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            fontFamily: 'OpenSans', 
          ),
          children: [
            TextSpan(text: '$label : '),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}