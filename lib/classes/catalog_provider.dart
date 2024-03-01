import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Product {
  String image;
  String title;
  String description;
  String planet;
  double price;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.planet,
      required this.price});
}

class CatalogProvider extends ChangeNotifier {
  List<Product> articles = [
    Product(
        image:
            'https://cdn.cnn.com/cnnnext/dam/assets/210408214556-pba-roca-super-tease.jpg',
        title: 'Martian rock',
        description:
            'Rock extracted from the Martian mines. It can contain traces of sulfur and quarck',
        planet: 'Mars',
        price: 120),
    Product(
        image:
            "https://th.bing.com/th/id/R.264fa673397116d1972be79bb2fffd2b?rik=1dsSC0SphCY50Q&riu=http%3a%2f%2fimages2.wikia.nocookie.net%2f__cb20110927182616%2fhalo%2fimages%2f9%2f9e%2fAntigrav_pack.png&ehk=7%2bfX4PfYoAr0IqJHAFVKGCwutelZi%2bGaL%2fQcwzQ6XFM%3d&risl=&pid=ImgRaw&r=0",
        title: "Jetpack",
        description:
            "This jetpack have been developed in the most important labs alongside Mars. Martian scientits have been researching how to create one for over 2 years. It is factory new.",
        planet: "Mars",
        price: 1200),
    Product(
        image:
            "https://th.bing.com/th/id/OIP.Y6vHpun5shzjH73rmX2P1AHaEy?pid=ImgDet&rs=1",
        title: "Laptop",
        description:
            "I bought this laptop 3 years ago but now I wanna buy another one cause I need a more powerful one. This is an Asus TUF Gaming F15 as nearly as factory new.",
        planet: "Earth",
        price: 650),
    Product(
        image:
            "https://th.bing.com/th/id/R.ad456d7a7c5eec1a5996c5015e8df150?rik=J%2fRQEUQwMfNSyA&pid=ImgRaw&r=0",
        title: "Volkswagen van",
        description:
            "I bought this van 2 years ago because I needed a big car to go travelling with my family but now I have divorced so I want to buy a two-door ferrari. Price is negotiable",
        planet: "Earth",
        price: 1552)
  ];

  List<Product> userProds = [];

  int _purchases = 0;

  int get purchases => _purchases;

  void increasePurchases() {
    _purchases = _purchases + 1;
    notifyListeners();
  }

  void addProduct(Product product) {
    articles.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    articles.remove(product);
    notifyListeners();
  }

  void addUserProduct(Product product) {
    userProds.add(product);
    notifyListeners();
  }
}
