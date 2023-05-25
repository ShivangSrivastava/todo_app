import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget card(String text) {
    var id = allTodos.indexOf(text);
    var sno = id + 1;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$sno. $text',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  allTodos.removeAt(id);
                });
              },
              icon: Icon(
                Icons.delete,
              ),
              label: Text(""),
            ),
          ],
        ),
      ),
    );
  }

  var value = "";
  List<String> allTodos = [];
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: allTodos.map((text) => card(text)).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add Todo',
                  ),
                  onChanged: (text) {
                    value = text;
                  },
                ),
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      if (value.isNotEmpty) {
                        allTodos.add(value);
                      }
                      controller.clear();
                      value = "";
                    });
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
