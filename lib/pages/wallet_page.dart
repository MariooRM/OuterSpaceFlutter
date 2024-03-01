import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:outerspace2/classes/catalog_provider.dart';
import 'package:outerspace2/classes/user_coins.dart';
import 'package:outerspace2/components/my_drawer.dart';
import 'package:outerspace2/components/nav_bar.dart';
import 'package:outerspace2/main.dart';
import 'package:outerspace2/pages/login_page.dart';
import 'package:outerspace2/components/my_textfield.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  bool _confirm = true;
  final _eurController = TextEditingController();
  final _ucController = TextEditingController();

  int purchases = 0;
  int _sells = 0;

  int _earnings = 0;

  void showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm operation'),
          content: const Text('Are you sure you want to convert this money?'),
          actions: [
            TextButton(
              onPressed: () {
                updateCoins();
                setState(() {
                  _eurController.text = "";
                  _confirm = true;
                });
                Navigator.of(context).pop();
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
  void initState() {
    super.initState();
    _eurController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _eurController.removeListener(_onChanged);
    _eurController.dispose();
    _ucController.dispose();
    super.dispose();
  }

  void _onChanged() {
    final value = double.tryParse(_eurController.text);
    if (value != null) {
      final ucValue = value * 2.5;
      _ucController.text = ucValue.toString();
    } else {
      _ucController.text = "";
    }
  }

  Future updateCoins() async {
    if (!_eurController.text.isEmpty) {
      double monedasRecogidas = double.parse(_ucController.text);

      UserCoins userCoins = Provider.of<UserCoins>(context, listen: false);
      double coinsAct = userCoins.coins;

      userCoins.setCoins(monedasRecogidas + coinsAct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: MyNavBar(actualIndex: 0),
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          "WALLET",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB6894E),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 25, 5),
            child: IconButton(
              icon: const Icon(Icons.help),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Page description'),
                      content: const Text(
                        """In this page you will see your account trade info as well as a money converter which you can use to convert your real money into the app coin.\n\n MONEY CONVERTER\n\n If you want to convert your real money to the app money, you only have to introduce the amount of it you want to convert. 1 EUR = 2.5 UC. \nWhen ready, just press the arrow icon!""",
                        style: TextStyle(fontFamily: "Capriola", fontSize: 15),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondoStartMenu.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black.withOpacity(0.8),
                      border: Border.all(color: const Color(0xFFB6894E)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB6894E),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Money Conversion',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Capriola',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: _eurController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText:
                                  '                                           EUR',
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_eurController.text != '') {
                              showConfirmationDialog();
                            }
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_down_circle_fill,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: _ucController,
                            enabled: false,
                            decoration: const InputDecoration(
                              hintText:
                                  '                                           UC',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB6894E),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Account transactions',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Capriola',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            const Text(
                              'Purchases: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Capriola',
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Consumer<CatalogProvider>(
                              builder: (context, userPurchases, _) {
                                return Text(
                                  userPurchases.purchases.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Capriola',
                                      fontSize: 20,
                                      color: Colors.white),
                                );
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            const Text(
                              'Sells: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Capriola',
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              _sells.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Capriola',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            const Text(
                              'Earnings: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Capriola',
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              _earnings.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Capriola',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
