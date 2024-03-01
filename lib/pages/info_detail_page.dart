import 'package:flutter/material.dart';
import 'package:outerspace2/pages/info_page.dart';

import '../components/nav_bar.dart';

class InfoDetailPage extends StatelessWidget {
  const InfoDetailPage({super.key, this.planet, this.ship});

  final Planet? planet;
  final Ship? ship;

  @override
  Widget build(BuildContext context) {
    String title = planet != null ? planet!.name : ship!.name;
    String image = planet != null ? planet!.image : ship!.image;
    String body = planet != null ? planet!.desc : ship!.desc;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "INFO",
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
        bottomNavigationBar: MyNavBar(actualIndex: 2),
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
                        image,
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
                              body,
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
