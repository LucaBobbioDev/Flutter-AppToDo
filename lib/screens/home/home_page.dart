import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(87, 37, 42, 52),
      appBar: AppBar(
        title: const Text("Wingman",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(220, 255, 46, 98),
      ),
      body: Center(
        child: Column(
          children: [
            Row( 
              children: [
                const Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white), 
                    textCapitalization:TextCapitalization.words
                  )
                ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.add, color: Colors.white,)),
              ],
            )
          ],
        )
      ),
    );
  }
}
