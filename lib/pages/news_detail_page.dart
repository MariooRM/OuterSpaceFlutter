import 'package:flutter/material.dart';
import 'package:outerspace2/components/my_drawer.dart';
import 'package:outerspace2/components/nav_bar.dart';
import 'package:outerspace2/pages/news.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage(
      {super.key, required this.news /*, required this.sumaMonedas*/});
  //ouble sumaMonedas;
  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "NEWS",
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
                            """In this section you will find the latest news about space and the new discoveries from the hand of our reporters.\nAs soon as a new civilization is discovered or an event occur, you will know!""",
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
        bottomNavigationBar: MyNavBar(actualIndex: 3),
        //drawer: MyDrawer(),
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
              child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFB6894E))),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Image.asset(
                        news.image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              news.body,
                              //textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Capriola"),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
