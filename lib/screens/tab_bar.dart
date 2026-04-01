import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; 
import 'dart:io';

import 'home_page.dart';
import 'cart_page.dart';
import 'account_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex; 
  
  const CustomBottomNavigationBar({super.key, this.selectedIndex = 0}); 

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex; 

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const CartPage(),
    const AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex; 
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double bottomPosition = screenHeight > 737 ? 0 : -10; 
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          
          if (isMobile)
            Positioned(
              left: 0,
              right: 0,
              bottom: bottomPosition,
              child: _buildBottomNavigationBar(),
            )
          else
            Positioned(
              left: 0,
              right: 0,
              top: 0, 
              child: _buildBottomNavigationBar(),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 25),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_filled, 'Home', 0),
          _buildNavItem(Icons.shopping_cart_outlined, 'Cart', 1),
          _buildNavItem(Icons.person_outline, 'Account', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = _selectedIndex == index;
    
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            decoration: isActive
                ? BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(20),
                  )
                : const BoxDecoration(color: Colors.transparent),
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
      ),
    );
  }
}