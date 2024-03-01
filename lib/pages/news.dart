import 'package:flutter/material.dart';
import 'package:outerspace2/components/my_drawer.dart';

import '../components/nav_bar.dart';
import 'news_detail_page.dart';

class News {
  String title;
  String image;
  String author;
  String body;

// News class

  News(
      {required this.title,
      required this.image,
      required this.author,
      required this.body});
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key /*, required this.sumaMonedas*/});
  //final double sumaMonedas;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    //double sumaMonedas = widget.sumaMonedas;
  }

  final List<News> newsList = [
    News(
        title: "Life discovered in Saturn!",
        image: 'assets/noticiaSaturno.jpg',
        author: 'BBC News',
        body:
            '''¡Exclusive Headline! Extraterrestrial Life Discovered on Saturn!
May 23, 2023 - Scientists at the International Space Agency (ISA) have announced a thrilling and astonishing discovery: conclusive evidence of life has been found on Saturn! After decades of space exploration and data analysis, the ISA's space probe "Saturnia" has transmitted images and measurements that confirm the presence of extraterrestrial organisms thriving on Saturn's moon, Enceladus.
The breakthrough came when Saturnia's advanced sensors detected complex organic molecules and a unique combination of chemical elements in the plumes emanating from Enceladus's subsurface ocean. Further analysis revealed the presence of microbial life forms remarkably similar to extremophiles found on Earth, suggesting the possibility of a parallel evolutionary process.
Dr. Amanda Collins, the lead scientist of the ISA's Enceladus mission, expressed her excitement and awe at the discovery. "This is a monumental moment in our quest for extraterrestrial life. Enceladus has provided us with compelling evidence that life can exist beyond our home planet. These findings have profound implications for our understanding of the universe and our place within it."
The discovery of life on Saturn has ignited a wave of speculation and scientific curiosity. Experts anticipate that further exploration missions to Enceladus will be launched in the coming years, with a focus on studying the alien ecosystem, investigating its potential for habitability, and searching for signs of more complex life forms.
This groundbreaking discovery not only revolutionizes our understanding of astrobiology but also raises profound philosophical and existential questions. Are we truly alone in the universe? How did life originate on Enceladus, and could similar processes have occurred elsewhere? These tantalizing questions will undoubtedly fuel scientific discourse and inspire future generations of researchers to unravel the mysteries of the cosmos.
As humanity celebrates this extraordinary achievement, the discovery of extraterrestrial life on Saturn marks a new chapter in our exploration of the cosmos and brings us closer to answering one of humanity's greatest existential queries: Are we alone in the universe?'''),
    News(
        title: "Advances in spacial trading",
        image: 'assets/noticiaComercio.jpg',
        author: "AS Mult",
        body:
            '''Following years of collaborative efforts between space agencies and private enterprises, the establishment of interplanetary supply chains has paved the way for a flourishing trade network between Earth and Mars. The success of recent Mars missions, including the colonization efforts on the Red Planet, has sparked a surge in demand for Martian resources, technology, and expertise.
One of the primary drivers of this thriving commerce is the rich abundance of rare minerals and raw materials found on Mars. Companies specializing in asteroid mining have set up operations on Mars, extracting valuable resources such as regolith, iron, titanium, and water ice. These resources, once scarce and costly on Earth, are now being shipped back home, fueling industries ranging from construction to aerospace.
Furthermore, the scientific breakthroughs achieved through Martian research and exploration have spurred the development of cutting-edge technologies. Martian laboratories have become hotbeds for innovation, attracting scientists, engineers, and entrepreneurs eager to leverage the unique conditions and challenges of the planet. From advancements in sustainable agriculture and terraforming techniques to breakthroughs in propulsion systems and space tourism, the Martian market is a hub of groundbreaking ideas and inventions.
The economic boom has not been limited to Earth-Mars trade alone. Collaboration between Martian colonies and terrestrial businesses has led to the emergence of joint ventures, fostering a symbiotic relationship between the two planets. Martian research stations have become testing grounds for futuristic technologies, while Earth-based companies provide crucial logistical support and infrastructure development. This interplanetary partnership has created a mutually beneficial ecosystem that drives economic growth and encourages further exploration and expansion.
As trade with Mars continues to flourish, governments and regulatory bodies are working diligently to establish interplanetary trade agreements, ensuring fair competition, resource allocation, and sustainable practices. The newfound economic prosperity has also prompted discussions on the need for an interplanetary currency and financial system to facilitate seamless transactions and investment opportunities.
With the trade between Earth and Mars reaching new heights, humanity stands on the cusp of a new era of interplanetary commerce. The possibilities for collaboration, innovation, and economic growth seem boundless as both planets embark on a shared journey of discovery and mutual benefit.''')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavBar(actualIndex: 3),
      drawer: MyDrawer(),
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
                        content: const Text(
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
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsDetailPage(news: newsList[index]),
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
                      newsList[index].title,
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
