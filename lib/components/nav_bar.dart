import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:outerspace2/pages/info_page.dart';
import 'package:outerspace2/pages/wallet_page.dart';
import 'package:outerspace2/pages/market_page.dart';
import 'package:outerspace2/pages/news.dart';

class MyNavBar extends StatefulWidget {
  MyNavBar({super.key, required this.actualIndex});

  int actualIndex;

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  late int selectedIndex;
  late double monedas;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.actualIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFB6894E),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          gap: 8,
          backgroundColor: Color(0xFFB6894E),
          activeColor: Colors.white,
          tabBackgroundColor: Colors.black.withOpacity(0.7),
          padding: EdgeInsets.all(8),
          tabs: const [
            GButton(
              icon: Icons.wallet,
              text: 'Wallet',
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: 'Market',
            ),
            GButton(icon: CupertinoIcons.book_fill, text: 'Info'),
            GButton(
              icon: Icons.newspaper,
              text: 'News',
            ),
          ],
          selectedIndex: selectedIndex,
          onTabChange: (selectedIndex) {
            switch (selectedIndex) {
              case 0:
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(
                        milliseconds:
                            200), // Ajusta la duración de la animación
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const WalletPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );

                break;
              case 1:
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(
                        milliseconds:
                            200), // Ajusta la duración de la animación
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MarketPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(
                        milliseconds:
                            200), // Ajusta la duración de la animación
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const InfoPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(
                        milliseconds:
                            200), // Ajusta la duración de la animación
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const NewsPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
