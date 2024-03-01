import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:outerspace2/classes/user_coins.dart';
import 'package:outerspace2/pages/help_page.dart';
import 'package:outerspace2/pages/login_or_register_page.dart';
import 'package:outerspace2/pages/user_products.dart';
import 'package:provider/provider.dart';

import '../pages/login_page.dart';
import '../pages/product_details_page.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String _firstName = "Mario";
  String _lastName = 'Rodrigo';
  int _age = 21;
  String _email = 'mario@gmail.com';
  int _purchases = 0;
  int _sells = 0;
  String _username = "marieteerm";
  int _earnings = 0;

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
    return Drawer(
      backgroundColor: Color(0xFFDCAE69).withOpacity(0.9),
      /*child: GestureDetector(onTap: hola, child: Icon(Icons.logout))*/
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Icon(
              CupertinoIcons.profile_circled,
              size: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.66,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Column(
                  children: [
                    // USER INFO

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text(
                      'Account info',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'BebasNeue',
                          fontSize: 30,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          'Name: ',
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 25,
                              color: Colors.blue),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _firstName,
                          style: const TextStyle(
                            fontFamily: 'LeagueGothic',
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _lastName,
                          style: const TextStyle(
                            fontFamily: 'LeagueGothic',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          'Username: ',
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 25,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          _username,
                          style: const TextStyle(
                            fontFamily: 'LeagueGothic',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          'Email: ',
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 25,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          _email,
                          style: const TextStyle(
                            fontFamily: 'LeagueGothic',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          'Age: ',
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 25,
                              color: Colors.blue),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _age.toString(),
                          style: const TextStyle(
                            fontFamily: 'LeagueGothic',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Image.asset(
                        'assets/Coin.png',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Consumer<UserCoins>(
                        builder: (context, userCoins, _) {
                          return Text(
                            userCoins.coins.toString(),
                            style: const TextStyle(
                              fontFamily: 'LeagueGothic',
                              fontSize: 25,
                            ),
                          );
                        },
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // USER'S PRODUCTS
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProductsPage(),
                  ),
                );
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                child: const Center(
                    child: Text(
                  'MY PRODUCTS',
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'BebasNeue',
                      fontSize: 30),
                )),
              ),
            ),
            const SizedBox(
              height: 30,
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
      ),
    );
  }
}
