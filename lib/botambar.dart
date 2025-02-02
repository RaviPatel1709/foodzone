import 'package:flutter/material.dart';
import 'package:loginappnew/botamscreen/setting.dart';
import 'botamscreen/addtocart.dart';
import 'botamscreen/explore.dart';
import 'botamscreen/categoress.dart';
import 'botamscreen/homepage.dart';

class botambar extends StatefulWidget {
  @override
  _botambarState createState() => _botambarState();
}

class _botambarState extends State<botambar> {
  int _selectedIndex = 0;
  double _iconSize = 24;

  final List<Widget> _widgetOptions = [
    Homepage(),
    explore(),
    categoress(),
    AddToCartScreen(),
    SettingScreen(product: {},),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0; // Navigate to Home when back button is pressed
          });
          return false;
        }
        return true; // Allow back button to exit the app if on Home
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: _selectedIndex == 3
            ? null // Hide the bottom navigation bar if the current selected index is 3 (AddToCartScreen)
            : Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.food_bank_outlined, size: _selectedIndex == 0 ? 24 : 20), // Animated size
                  ),
                  label: 'Foodzone',
                ),
                BottomNavigationBarItem(
                  icon: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.grid_view_rounded, size: _selectedIndex == 1 ? 24 : 20),
                  ),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 2 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.explore_rounded, size: _selectedIndex == 2 ? 24 : 20),
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 3 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.shopping_cart_outlined, size: _selectedIndex == 3 ? 24 : 20),
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 4 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.person_rounded, size: _selectedIndex == 4 ? 24 : 20),
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFFFF7043),  // Orange color for selected icon
              unselectedItemColor: Colors.black87, // Lighter orange for unselected icons
              showUnselectedLabels: true,
              selectedFontSize: 13,
              unselectedFontSize: 11,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              backgroundColor: Colors.white, // Set bottom navigation background to white
              elevation: 10,
            ),
          ),
        ),
      ),
    );
  }
}

