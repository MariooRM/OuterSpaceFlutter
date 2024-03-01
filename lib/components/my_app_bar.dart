import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    super.key,
    required this.monedas,
    required this.tit,
  });

  double monedas;
  String tit;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  late String title;

  double _coins = 0;

  void initState() {
    super.initState();
    title = widget.tit;
    _coins = widget.monedas;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Color(0xFFB6894E),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Image.asset(
                'assets/Coin.png',
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                _coins.toString(),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
