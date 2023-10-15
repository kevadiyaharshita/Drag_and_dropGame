import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:darg_and_drop_game/utils/color_utils.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vibration/vibration.dart';

import '../../controller/Audio_Controller.dart';
import '../../utils/alphabet_utils.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  Color myColor = Colors.blueGrey;
  late ConfettiController confettiController;

  Random r = Random();
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = r.nextInt(allColors.length);

    confettiController = ConfettiController(
      duration: Duration(
        seconds: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/564x/b1/04/d3/b104d30ad5a81ee38170fd0b4dfc9422.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Image(
              image: AssetImage('assets/images/pinkgb.png'),
            ),
            Gap(10),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffCE296E),
                        Color(0xffD3296E),
                        Color(0xffD83879),
                        Color(0xffED7EAB),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: DragTarget(
                    builder: (context, _, __) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 190,
                            width: 180,
                            child: Image.asset(
                              'assets/images/colors/${allColors[index]}.png',
                            ),
                          ),
                          Container(
                            height: 190,
                            width: 180,
                            child: Image.asset(
                              'assets/images/colors/${allColors[index]}.png',
                              color: myColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      );
                    },
                    onWillAccept: (data) {
                      if (data == allColors[index]) {
                        Vibration.vibrate(
                          pattern: [500, 500],
                        );
                        colorScore = colorScore + 10;
                        openSongs(
                            path:
                                'assets/audio/mixkit-ethereal-fairy-win-sound-2019.wav');
                      } else {
                        Vibration.vibrate(
                          pattern: [100, 1000],
                        );
                        colorScore = colorScore - 5;
                        openSongs(path: 'assets/audio/negative_beeps-6008.mp3');
                      }
                      setState(() {});
                      return data == allColors[index];
                    },
                    onAccept: (data) {
                      setState(
                        () {
                          myColor = Colors.transparent;
                          confettiController.play();
                          Future.delayed(Duration(seconds: 3), () {
                            allColors.removeAt(index);
                            index = r.nextInt(allColors.length);
                            myColor = Colors.grey;
                            setState(() {});
                          });
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: confettiController,
                    blastDirection: pi / 2,
                    blastDirectionality: BlastDirectionality.explosive,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 50,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffCE296E),
                    Color(0xffD3296E),
                    Color(0xffD83879),
                    Color(0xffED7EAB),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Score : ${colorScore.toString().padLeft(2, '0')}",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              width: w,
              height: 380,
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.3)
                    // Color(0xffCE296E).withOpacity(0.2),
                    // Color(0xffD3296E).withOpacity(0.2),
                    // Color(0xffD83879).withOpacity(0.2),
                    // Color(0xffED7EAB).withOpacity(0.2),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              // color: Colors.pink,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 5,
                ),
                itemCount: allColors.length,
                itemBuilder: (context, index) {
                  return Draggable(
                    data: allColors[index],
                    feedback: Container(
                      height: 190,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/colors/${allColors[index]}.png'),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                    child: Container(
                      height: 90,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/colors/${allColors[index]}.png',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
