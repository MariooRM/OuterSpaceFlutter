import 'dart:async';

import 'package:flutter/material.dart';

class LoadingText extends StatefulWidget {
  const LoadingText({Key? key}) : super(key: key);

  @override
  _LoadingTextState createState() => _LoadingTextState();
}

class _LoadingTextState extends State<LoadingText> {
  String loadingText = 'Loading profile';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (loadingText.endsWith('...')) {
            loadingText = 'Loading profile';
          } else {
            loadingText += '.';
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      loadingText,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 35,
        decoration: TextDecoration.none,
        shadows: [
          Shadow(
            blurRadius: 3.0,
            color: Colors.black,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
    );
  }
}
