import 'package:flutter/material.dart';
import 'package:outerspace2/classes/catalog_provider.dart';
import 'package:outerspace2/components/my_drawer.dart';
import 'package:outerspace2/pages/product_details_page.dart';
import 'package:provider/provider.dart';

import '../components/nav_bar.dart';
import 'news_detail_page.dart';

class UserProductsPage extends StatefulWidget {
  const UserProductsPage({super.key});

  @override
  State<UserProductsPage> createState() => _UserProductsPageState();
}

class _UserProductsPageState extends State<UserProductsPage> {
  @override
  Widget build(BuildContext context) {
    CatalogProvider cat = Provider.of<CatalogProvider>(context, listen: false);
    final List<Product> prods = cat.userProds;

    return Scaffold(
      bottomNavigationBar: MyNavBar(actualIndex: 0),
      //drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          "USER'S PRODUCTS",
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
                        content: const Text(
                          """In this section you can see the products you have purchased in the app""",
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondoStartMenu.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: ListView.builder(
              itemCount: prods.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                            product: prods[index], showButton: false),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(18.0),
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Color(0xFFB6894E))),
                    child: Text(
                      prods[index].title,
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
