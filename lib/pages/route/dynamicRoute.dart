import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}


class DynamicRoute extends StatelessWidget {
  DynamicRoute({Key key}) : super(key: key);

  final List<Todo> todos = List<Todo>.generate(20, (i){
    return Todo('Todo $i', 'A description of $i');
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(todo: todos[index]),
                    ));
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen({Key key, @required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${todo.title}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${todo.description}'),
      ),
    );
  }
}
