import 'package:darg_and_drop_game/utils/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            'https://i.pinimg.com/564x/b1/04/d3/b104d30ad5a81ee38170fd0b4dfc9422.jpg',
          ),
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
            Gap(30),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MyRoutes.alphabetspage);
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      // color: Colors.pink,
                      image: DecorationImage(
                        image: AssetImage('assets/images/alphabet.png'),
                      ),
                    ),
                  ),
                ),
                Gap(30),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MyRoutes.numberspage);
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      // color: Colors.pink,
                      image: DecorationImage(
                        image: AssetImage('assets/images/numbers.png'),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Gap(30),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MyRoutes.fruitpage);
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      // color: Colors.pink,
                      image: DecorationImage(
                          image: AssetImage('assets/images/fruits.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Gap(30),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MyRoutes.animalpage);
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      // color: Colors.pink,
                      image: DecorationImage(
                          image: AssetImage('assets/images/animals.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Gap(30),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MyRoutes.shapepage);
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      // color: Colors.pink,
                      image: DecorationImage(
                          image: AssetImage('assets/images/shapes.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Gap(30),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MyRoutes.colorpage);
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      // color: Colors.pink,
                      image: DecorationImage(
                          image: AssetImage('assets/images/colors.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
