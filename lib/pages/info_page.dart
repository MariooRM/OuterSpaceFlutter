import 'package:flutter/material.dart';
import 'package:outerspace2/components/my_drawer.dart';
import 'package:outerspace2/components/nav_bar.dart';
import 'package:outerspace2/pages/info_detail_page.dart';

class Planet {
  String name;
  String image;
  String desc;

// News class

  Planet({required this.name, required this.image, required this.desc});
}

class Ship {
  String name;
  String image;
  String desc;

// News class

  Ship({required this.name, required this.image, required this.desc});
}

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final List<Planet> _planetsList = [
    Planet(
        name: 'Mars',
        image: 'assets/martianCity.jpg',
        desc:
            '''The civilization on Mars has developed around the more habitable regions of the planet, such as valleys, canyons, and deep craters, where there is abundant water and more protection against radiation.
The Martian civilization has built subterranean and elevated structures that are resistant to the extreme temperatures and low atmospheric pressure of Mars. These structures are designed to capture and store energy from the sun, which is abundant on the planet.
The civilization has harnessed the planet's resources, including water, carbon dioxide, and valuable minerals such as iron, nickel, and cobalt. They have developed advanced technology to extract and process these resources, which are used to produce oxygen, food, and fuel for the civilization.
The Martian civilization has developed a unique language that has evolved to be more effective in the specific conditions of the planet. They also wear specialized suits that provide protection against radiation, extreme temperatures, and low atmospheric pressure. These suits are equipped with life support and communication systems, allowing the Martians to survive and thrive in their environment.
Overall, the Martian civilization is a remarkable example of ingenuity and resilience, demonstrating how there are beings who can adapt to and thrive in the most challenging environments in the solar system.'''),
  ];

  final List<Ship> _shipList = [
    Ship(
        name: 'AT-104',
        image: 'assets/at104.jpg',
        desc:
            '''The AT-104 spacecraft is a highly advanced and innovative vessel developed for long-range space travel. It is designed to carry a crew of up to 10 people and can travel at speeds of up to 50,000 kilometers per hour, making it one of the fastest spacecraft in existence.
The AT-104 is equipped with advanced propulsion systems that use a combination of nuclear fusion and ion engines to generate immense thrust, allowing it to accelerate quickly and maintain high speeds over long distances. It is also equipped with a state-of-the-art navigation system that uses advanced AI algorithms to plot the most efficient course through space and avoid hazards such as asteroids and gravitational fields.
The spacecraft is designed to be highly autonomous, with a fully automated life support system that can sustain the crew for extended periods of time. It is also equipped with advanced shielding technology that protects the crew from the harsh radiation and extreme temperatures of space.
The AT-104 features advanced communication systems that allow it to stay in contact with Earth and other spacecraft throughout its journey. It also has a highly adaptable cargo system that can accommodate a wide variety of payloads, including scientific instruments, rovers, and even small spacecraft.
Overall, the AT-104 is an impressive spacecraft that represents the cutting edge of space technology. With its advanced propulsion, navigation, and life support systems, it is capable of traveling vast distances through space and exploring the farthest reaches of the universe.''')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: MyNavBar(actualIndex: 2),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondoStartMenu.jpeg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFB6894E))),
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB6894E),
                    ),
                    child: const Center(
                      child: Text(
                        'PLANETS',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Capriola",
                            fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _planetsList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoDetailPage(
                                  planet: _planetsList[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(
                                bottom: 7.0, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 214, 160, 88),
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: Color.fromARGB(255, 214, 160, 88))),
                            child: Center(
                              child: Text(
                                _planetsList[index].name,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontFamily: "Capriola"),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFB6894E))),
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB6894E),
                    ),
                    child: const Center(
                      child: Text(
                        'SPACESHIPS',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Capriola",
                            fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _shipList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoDetailPage(
                                  ship: _shipList[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(
                                bottom: 7.0, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 214, 160, 88),
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: Color.fromARGB(255, 214, 160, 88))),
                            child: Center(
                              child: Text(
                                _shipList[index].name,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontFamily: "Capriola"),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
