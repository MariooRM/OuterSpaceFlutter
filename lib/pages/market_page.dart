import 'package:flutter/material.dart';

import 'package:outerspace2/components/my_drawer.dart';
import 'package:outerspace2/components/my_textfield.dart';
import 'package:outerspace2/components/nav_bar.dart';
import 'package:outerspace2/pages/product_details_page.dart';
import 'package:outerspace2/pages/wallet_page.dart';
import 'package:provider/provider.dart';

import '../classes/catalog_provider.dart';
import 'add_product_page.dart';

class MarketPage extends StatefulWidget {
  MarketPage({Key? key}) : super(key: key);

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  String sumaMonedas = "0";
  final _searchController = TextEditingController();
  List<Product> filteredProducts = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final searchQuery = _searchController.text.toLowerCase();

    setState(() {
      if (searchQuery.isEmpty) {
        filteredProducts = [];
        isSearching = false;
      } else {
        final catalogProvider =
            Provider.of<CatalogProvider>(context, listen: false);
        filteredProducts = catalogProvider.articles
            .where((product) =>
                product.title.toLowerCase().startsWith(searchQuery))
            .toList();
        isSearching = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MyDrawer(),
      bottomNavigationBar: MyNavBar(actualIndex: 1),
      appBar: AppBar(
        title: const Text(
          "MARKET",
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
                        """In this page you will see the current available products in the catalog. You can buy any of them as long as you have enough money. \nYou can also add your own items the shop, so another users can purchase them! """,
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondoStartMenu.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Search for products",
                  fillColor: Colors.grey.withOpacity(0.8),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            // Catálogo de productos

            Consumer<CatalogProvider>(
              builder: (context, catalogProvider, _) {
                final products =
                    isSearching ? filteredProducts : catalogProvider.articles;
                return Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFB6894E)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                  product: product,
                                  showButton: true,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Image.network(
                                product.image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                product.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Capriola",
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),

            const SizedBox(
              height: 20,
            ),

            // Botón para añadir productos

            Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProductPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
