import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:outerspace2/pages/start_menu.dart';
import 'package:video_player/video_player.dart';
import 'package:outerspace2/components/loading_text.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late VideoPlayerController _controller;

  _LoadingPageState() {
    Timer(const Duration(milliseconds: 5000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => StartMenu()),
            (route) => false);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    try {
      _controller = VideoPlayerController.asset('assets/fondoInicio.mp4')
        ..initialize().then((_) {
          _controller.play();
          _controller.setLooping(true);
          setState(() {});
        });
    } catch (e, stackTrace) {
      print(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(7.0)),
                      ),
                      Image.asset(
                        'assets/mensajeLoading.png',
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(7.0)),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        'assets/loadingGif.gif',
                        height: 250,
                      ),
                      LoadingText(),
                    ],
                  ),
                )
              ],
            )),
      ]),
    );
  }
}
