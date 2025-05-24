import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displayText = "No Text";

  TextEditingController txtcontroller = TextEditingController();

  List<String> todoList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List App"),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),

        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: txtcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter text",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  height: 40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    setState(() {
                      todoList.add(txtcontroller.text);
                      txtcontroller.clear();
                    });
                  },
                  child: Icon(Icons.add, color: Colors.black,),
                ),
              ],
            ),

            Flexible(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(todoList[index],style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                        ),
                      ),
                      MaterialButton(
                        height: 40,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Icon(Icons.delete, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                      ),
                    ],
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
