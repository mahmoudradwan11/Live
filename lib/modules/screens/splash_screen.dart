import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:live/modules/home.dart';
import 'package:live/modules/widgets/functions/navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startDelay(){
    _timer = Timer(const Duration(seconds: 4),_goNext);
  }
  void _goNext(){
    navigateAndReplace(context,const Home());
  }
  @override
  void initState(){
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Container(
              height: 100,
                width: 100,
                child: const Image(image:AssetImage('images/logo.png'))),
            DefaultTextStyle(style:const TextStyle(
                color: Colors.orangeAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
              child:AnimatedTextKit(
              animatedTexts:[
                WavyAnimatedText('Live News',),
              ],
              isRepeatingAnimation: true,
            ),
            )
          ],
        ),
      ),
    );
  }
  @override
  dispose(){
    _timer!.cancel();
    super.dispose();
  }
}
