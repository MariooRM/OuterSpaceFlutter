import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:outerspace2/pages/market_page.dart';
import 'login_or_register_page.dart';
import 'wallet_page.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({super.key});

  @override
  State<StartMenu> createState() => _StartMenuPage();
}

class _StartMenuPage extends State<StartMenu> {
  late double _coins;
  late bool _confirm;

  void showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm logout'),
          content: const Text('Are you sure you wanna logout?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _confirm = true;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginOrRegisterPage()));
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _confirm = false;
                });
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WalletPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondoStartMenu.jpeg'),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
              child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Image.asset('assets/titStartMenu.png'),
                Image.asset(
                  'assets/esloganStartMenu.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
                SizedBox(
                  height: 125,
                ),
                const Text(
                  'Tap the screen and enjoy your trip!',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Capriola",
                      fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  onPressed: () {
                    showConfirmationDialog();
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    child: const Center(
                        child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'BebasNeue',
                          fontSize: 30),
                    )),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
