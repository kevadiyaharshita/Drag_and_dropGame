import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/alphabet_utils.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    Color myColor = Colors.grey;

    Random r = Random();
    int index = 0;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = r.nextInt(2);
          });
        },
      ),
      body: Column(
        children: [
          Container(
            width: w,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          // Gap(20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Container(
                  height: h - 130,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.withOpacity(0.7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Draggable(
                        data: 'A',
                        feedback: Container(
                          height: 90,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/A.png'),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(),
                        child: Container(
                          height: 90,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/A.png'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/H.png'),
                        )),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Container(
                  height: h - 130,
                  width: 200,
                  child: Column(
                    children: [
                      DragTarget(
                        builder: (context, _, __) {
                          return Stack(
                            children: [
                              Container(
                                height: 90,
                                width: 80,
                                child: Image.asset(
                                  'assets/images/A.png',
                                ),
                              ),
                              Container(
                                height: 90,
                                width: 80,
                                child: Image.asset(
                                  'assets/images/A.png',
                                  color: myColor,
                                ),
                              ),
                            ],
                          );
                        },
                        onWillAccept: (data) {
                          return data == allAlphabet[index];
                        },
                        onAccept: (data) {
                          setState(
                            () {
                              myColor = Colors.transparent;
                            },
                          );
                        },
                      ),
                      DragTarget(
                        builder: (context, _, __) {
                          return Stack(
                            children: [
                              Container(
                                height: 90,
                                width: 80,
                                child: Image.asset(
                                  'assets/images/H.png',
                                ),
                              ),
                              Container(
                                height: 90,
                                width: 80,
                                child: Image.asset(
                                  'assets/images/H.png',
                                  color: myColor,
                                ),
                              ),
                            ],
                          );
                        },
                        onWillAccept: (data) {
                          return data == allAlphabet[index];
                        },
                        onAccept: (data) {
                          setState(
                            () {
                              myColor = Colors.transparent;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = r.nextInt(2);
          });
        },
      ),
      body: Column(
        children: [
          Container(
            width: w,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          // Gap(20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Container(
                  height: h - 130,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.withOpacity(0.7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Draggable(
                        data: 'A',
                        feedback: Container(
                          height: 90,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/A.png'),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(),
                        child: Container(
                          height: 90,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/A.png'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/H.png'),
                        )),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Container(
                  height: h - 130,
                  width: 200,
                  child: Column(
                    children: [
                      DragTarget(
                        builder: (context, _, __) {
                          return Stack(
                            children: [
                              Container(
                                height: 90,
                                width: 80,
                                child: Image.asset(
                                  'assets/images/A.png',
                                ),
                              ),
                              Container(
                                height: 90,
                                width: 80,
                                child: Image.asset(
                                  'assets/images/A.png',
                                  color: myColor,
                                ),
                              ),
                            ],
                          );
                        },
                        onWillAccept: (data) {
                          return data == allAlphabet[index];
                        },
                        onAccept: (data) {
                          setState(
                            () {
                              myColor = Colors.transparent;
                            },
                          );
                        },
                      ),
                      DragTarget(
                        builder: (context, _, __) {
                          return Stack(
                            children: [
                              Container(
                                height: 90,
                                width: 80,
                                child: Image.asset(
                                  'assets/images/H.png',
                                ),
                              ),
                              Container(
                                height: 90,
                                width: 80,
                                child: Image.asset(
                                  'assets/images/H.png',
                                  color: myColor,
                                ),
                              ),
                            ],
                          );
                        },
                        onWillAccept: (data) {
                          return data == allAlphabet[index];
                        },
                        onAccept: (data) {
                          setState(
                            () {
                              myColor = Colors.transparent;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
*/
