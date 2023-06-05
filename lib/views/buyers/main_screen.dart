import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'nav_Screens/Account_Screen.dart';
import 'nav_Screens/Cart_Screen.dart';
import 'nav_Screens/Category_Screen.dart';
import 'nav_Screens/Search_Screen.dart';
import 'nav_Screens/Store_screen.dart';
import 'nav_Screens/home_Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

List<Widget> _pages=[
  HomeScreen(),
  CategoryScreen(),
  StoreScreen(),
  SearchScreen(),
  CartScreen(),
  AccountScreen(),

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
              
          });
            
          },
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.yellow.shade900,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/explore.svg',
                width: 20,
              ),
              label: 'CATEGORIES',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/store.svg',
                width: 20,
              ),
              label: 'STORE',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/searcg.svg',
                width: 20,
              ),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/cart.svg',
                width: 20,
              ),
              label: 'CART', 
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/account.svg',
                width: 20,
              ),
              label: 'ACCOUNT', 
            ),
          ]
          ),
          body: _pages[_pageIndex],
    );
  }
}
