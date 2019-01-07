import 'package:flutter/material.dart';
import 'package:flutter_first/refresh/CommonStyle.dart';
import 'package:flutter_first/sqfile/ToDoProvider.dart';

class SqfliteDemoPage extends StatefulWidget {
  @override
  _SqfliteDemoPageState createState() => _SqfliteDemoPageState();
}

class _SqfliteDemoPageState extends State<SqfliteDemoPage> {
  List<Todo> todoList = new List();
  TodoProvider todoProvider;

  @override
  void initState() {
    super.initState();
    todoProvider = new TodoProvider();
    _initProvider();
  }

  @override
  void dispose() {
    super.dispose();
    todoProvider.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SqfliteDemoPage"),
      ),
      body: Container(
          child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new RaisedButton(
            onPressed: _addTodo,
            child: new Text("添加"),
          ),
          Expanded(
            child: new ListView.builder(
              itemBuilder: (context, index) {
                return _getItem(index);
              },
              itemCount: todoList.length,
            ),
          )
        ],
      )),
    );
  }

  void _addTodo() async {
    Todo todo = new Todo();
    todo.title = "todo something";
    todo.done = true;
    todo = await todoProvider.insert(todo);
    setState(() {
      todoList.add(todo);
    });
  }

  Widget _getItem(index) {
    Todo todo = todoList[index];
    int id = todo.id;
    String title = todo.title;
    return Container(
      height: 50,
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 1,
            color: new Color(CommonColors.divideColor),
          ),
        ),
      ),
      child: new Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: new Text("ID:$id"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text("title:$title"),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: new RaisedButton(
              onPressed: () {
                _delete(index);
              },
              child: new Text("删除"),
            ),
          )
        ],
      ),
    );
  }

  _delete(index) async {
    Todo todo = todoList[index];
    await todoProvider.delete(todo.id);
    setState(() {
      todoList.remove(todo);
    });
  }

  void _initProvider() async {
    await todoProvider.open("todo.db");
    List<Todo> todoList = await todoProvider.getList();
    setState(() {
      this.todoList = todoList;
    });
  }
}
