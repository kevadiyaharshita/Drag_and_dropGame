import 'package:darg_and_drop_game/utils/MyRoutes.dart';
import 'package:darg_and_drop_game/views/screens/alphabet_page.dart';
import 'package:darg_and_drop_game/views/screens/animals_page.dart';
import 'package:darg_and_drop_game/views/screens/color_page.dart';
import 'package:darg_and_drop_game/views/screens/fruits_page.dart';
import 'package:darg_and_drop_game/views/screens/home_page.dart';
import 'package:darg_and_drop_game/views/screens/number_page.dart';
import 'package:darg_and_drop_game/views/screens/shapes_page.dart';
import 'package:darg_and_drop_game/views/screens/temp_file_alpha.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.alphabetspage: (context) => AlphabetsPage(),
        MyRoutes.numberspage: (context) => NumberPage(),
        MyRoutes.fruitpage: (context) => FruitsPage(),
        MyRoutes.animalpage: (context) => AnimalPage(),
        MyRoutes.shapepage: (context) => ShapesPage(),
        MyRoutes.colorpage: (context) => ColorPage(),
      },
    );
  }
}
