import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:outerspace2/classes/user_coins.dart';
import 'package:outerspace2/pages/market_page.dart';
import 'package:provider/provider.dart';

import '../classes/catalog_provider.dart';
import '../components/nav_bar.dart';
import '../components/sign_button.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage(
      {super.key, required this.product, required this.showButton});

  final Product product;
  bool showButton;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool _confirm = false;
  bool showButton = false;

  @override
  void initState() {
    super.initState();
    showButton = widget.showButton;
  }

  void purchase() {
// Obtener las monedas del usuario
    final userCoins = Provider.of<UserCoins>(context, listen: false);
    double coins = userCoins.coins;
    if (coins < widget.product.price) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Not enough money to purchase this item'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm purchase'),
            content: const Text('Do you really want to purchase this item?'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _confirm = true;
                  });

                  Provider.of<CatalogProvider>(context, listen: false)
                      .removeProduct(widget.product);

                  Provider.of<CatalogProvider>(context, listen: false)
                      .addUserProduct(widget.product);

                  Provider.of<CatalogProvider>(context, listen: false)
                      .increasePurchases();

                  // Actualizar las monedas del usuario
                  double newCoins = coins - widget.product.price;
                  userCoins.setCoins(newCoins);

                  // Regresar a la pantalla anterior
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MarketPage(),
                    ),
                  );
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
  }

  @override
  Widget build(BuildContext context) {
    String image = widget.product.image;
    String title = widget.product.title;
    String desc = widget.product.description;
    String planet = widget.product.planet;
    double price = widget.product.price;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MARKET",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFB6894E),
        actions: [
          Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 25, 5),
              child: IconButton(
                icon: Icon(Icons.help),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Page description'),
                        content: Text(
                          """Life in other planets was discovered a long time ago and our scientis are still seraching for another forms of life in another planets. In this section you will be able to see information about the planets with discovered life and also information about the spaceships our explorers use to travel along the bast universe.""",
                          style:
                              TextStyle(fontFamily: "Capriola", fontSize: 15),
                        ),
                        actions: [
                          TextButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ))
        ],
      ),
      bottomNavigationBar: MyNavBar(actualIndex: 1),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondoStartMenu.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 60),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.62,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFFB6894E))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 280,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        price.toString() + " uc",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Capriola",
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title + " - " + planet,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Capriola",
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          desc,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Capriola",
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: showButton,
              child: SignButton(
                  onTap: () {
                    purchase();
                  },
                  message: 'Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}
