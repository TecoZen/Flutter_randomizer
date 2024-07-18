import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class PracticeMain extends StatefulWidget {
  const PracticeMain({super.key});

  @override
  State<PracticeMain> createState() => _PracticeMainState();
}

class _PracticeMainState extends State<PracticeMain> {
  final random = Random();

  double boxHeight = 100;
  double boxWidth = 100;
  Color boxColor = Colors.deepPurple;
  BorderRadius _borderRadius = BorderRadius.circular(8);

  void changeBoxSize() {
    setState(() {
      boxWidth = random.nextInt(400).toDouble();
      boxHeight = random.nextInt(400).toDouble();
    });
  }

  void _changeRadius() {
    setState(() {
      _borderRadius = BorderRadius.circular(random.nextInt(80).toDouble());
    });
  }

  void _changeBoxColor() {
    setState(() {
      boxColor = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: changeBoxSize,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                width: boxWidth,
                height: boxHeight,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: _borderRadius,
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            right: 15,
            child: buildWavyAnimation(),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: _changeBoxColor, icon: const Icon(Icons.palette)),
          IconButton(onPressed: _changeRadius, icon: const Icon(Icons.interests)),
          IconButton(onPressed: changeBoxSize, icon: const Icon(Icons.aspect_ratio)),
        ],
      ),
    );
  }
  
  Widget buildWavyAnimation() => Center(
    child: AnimatedTextKit(
      animatedTexts: [WavyAnimatedText("DanNavs", textStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.grey
         ))],
      repeatForever: true,
    ),

  );
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PracticeMain(),
  ));
}
