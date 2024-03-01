import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../classes/catalog_provider.dart';
import '../components/my_drawer.dart';
import '../components/my_textfield.dart';
import '../components/nav_bar.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _planetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? imagePath;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //drawer: MyDrawer(),
      bottomNavigationBar: MyNavBar(actualIndex: 1),
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
                        title: const Text('Page description'),
                        content: const Text(
                          """Enter the requested info about the product you want to upload to the app""",
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondoStartMenu.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFB6894E)),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFB6894E),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          'ADD YOUR PRODUCT!',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Capriola",
                              fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        controller: _titleController,
                        labelText: 'Product',
                        hintText: 'Product name',
                        obscureText: false),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                        controller: _imageUrlController,
                        labelText: 'Image URL',
                        hintText: 'Product image url',
                        obscureText: false),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                        controller: _descriptionController,
                        labelText: 'Description',
                        hintText: 'Product description',
                        obscureText: false),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                        controller: _planetController,
                        labelText: 'Planet',
                        hintText: 'Product origin planet',
                        obscureText: false),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        controller: _priceController,
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16),
                          labelText: "Price",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Product price",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // Cambia el color de fondo
              ),
              onPressed: () {
                // Obtener los valores ingresados por el usuario
                final String title = _titleController.text;
                final String imageUrl = _imageUrlController.text;
                final String description = _descriptionController.text;
                final double price =
                    double.tryParse(_priceController.text) ?? 0.0;
                final String planet = _planetController.text;

                // Validar los campos requeridos
                if (title.isEmpty ||
                    imageUrl.isEmpty ||
                    description.isEmpty ||
                    planet.isEmpty ||
                    price.isNaN) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.red,
                        title: Text(
                          'Error',
                          style: TextStyle(color: Colors.white),
                        ),
                        content: Text(
                          'All fields must be filled',
                          style: TextStyle(color: Colors.white),
                        ),
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
                  // Crear el objeto Item con los datos ingresados
                  final Product newProduct = Product(
                      image: imageUrl.toString(),
                      title: title,
                      description: description,
                      planet: planet,
                      price: price);

                  // Agregar el nuevo producto al catálogo
                  Provider.of<CatalogProvider>(context, listen: false)
                      .addProduct(newProduct);

                  // Regresar a la pantalla anterior
                  Navigator.of(context).pop();
                }
              },
              child: const Icon(
                CupertinoIcons.add,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
