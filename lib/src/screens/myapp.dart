

import 'package:flutter/material.dart';

//Importando o componente HomePage
import '../home/home_page.dart';

class MyApp extends StatelessWidget {
  //Identificador na árvore de Widgets
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}