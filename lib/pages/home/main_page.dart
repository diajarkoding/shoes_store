import 'package:flutter/material.dart';
import 'package:toko_sepatu/pages/home/chat_page.dart';
import 'package:toko_sepatu/pages/home/home_page.dart';
import 'package:toko_sepatu/pages/home/profile_page.dart';
import 'package:toko_sepatu/pages/home/wishlist_page.dart';
import 'package:toko_sepatu/shared/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20,
      ),
    );
  }

  Widget customBottomNav() {
    return ClipRRect(
      borderRadius:
          const BorderRadius.vertical(top: Radius.circular(defaultMargin)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: backgroudColor4,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 21,
                    color: currentIndex == 0
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  child: Image.asset(
                    'assets/icon_chat.png',
                    width: 20,
                    color: currentIndex == 1
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                  child: Image.asset(
                    'assets/icon_wishlist.png',
                    width: 20,
                    color: currentIndex == 2
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 18,
                    color: currentIndex == 3
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: ''),
          ],
        ),
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatPage();
      case 2:
        return const WishListPage();
      case 3:
        return const ProfilePage();

      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroudColor1 : backgroudColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
