import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:outerspace2/pages/wallet_page.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  void movePages(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WalletPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HELP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFB6894E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => movePages(context),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/fondoStartMenu.jpeg",
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFB6894E)),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Is there anything you need?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontFamily: 'BebasNeue',
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Center(
                          child: Column(children: const [
                        Text(
                          """OuterSpace is an app which allows you to interact with people from another planets.You can learn how they live, informartion about their technology and you can also trade your products with them!""",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Capriola',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          """Let's show you the app main pages: """,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Capriola',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        //HOME INFO

                        Text(
                          """ HOME""",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: 'LeagueGothic',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          """In this page you will see your account trade info as well as a money conversor which you can use to convert your real money into the app coin.""",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Capriola',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        // MARKET INFO

                        Text(
                          """ MARKET""",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: 'LeagueGothic',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          """In this page you will see the current available products in the catalog. You can buy any of them as long as you have enough money. \nYou can also add your own items the shop, so another users can purchase them! """,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Capriola',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        // ARCHIVES INFO

                        Text(
                          """ ARCHIVES""",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: 'LeagueGothic',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          """Life in other planets was discovered a long time ago and our scientis are still seraching for another forms of life in another planets. In this section you will be able to see information about the planets with discovered life and also information about the spaceships our explorers use to travel along the bast universe.""",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Capriola',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ]))),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
