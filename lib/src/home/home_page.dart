import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = <String>[];
  final addController = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(87, 37, 42, 52),
      appBar: AppBar(
        title: const Text(
          "Wingman",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(220, 255, 46, 98),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: addController,
                style: const TextStyle(color: Colors.white),
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: 'Digite sua tarefa:',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(220, 255, 46, 98),
                  ),
                ),
              )),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: list.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 15),
              itemBuilder: (context, index) {
                final item = list[index];
                return ListTile(
                  tileColor: const Color.fromARGB(220, 255, 46, 98),
                  title: Text(
                    item,
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: IconButton(
                      onPressed: () {
                        setState(() {
                          list.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                  trailing: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: const Color.fromARGB(235, 64, 74, 94),
                        builder: (context) {
                          return SizedBox(
                              height: 2000,
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Center(
                                    child: Text('Editar tarefa',
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.white)),
                                  ),
                                  TextField(
                                      controller: editController,
                                      style:const TextStyle(color: Colors.white),
                                      textCapitalization: TextCapitalization.words,
                                      decoration: const InputDecoration(
                                        hintText: 'Digite sua tarefa:',
                                        hintStyle: TextStyle(
                                          color:Color.fromARGB(220, 255, 46, 98),
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      )
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        final newText = editController.text;
                                        setState(() {
                                          list.removeAt(index);
                                          list.add(newText);
                                        });
                                        editController.clear();
                                        FocusScope.of(context).unfocus();
                                      },
                                      icon: const Icon(
                                        Icons.add_task,
                                        color: Color.fromARGB(220, 255, 46, 98),
                                      ))
                                ],
                              ));
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(220, 255, 46, 98),
        onPressed: () {
          final text = addController.text;
          setState(() {
            list.add(text);
          });
          addController.clear();
          FocusScope.of(context).unfocus();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
