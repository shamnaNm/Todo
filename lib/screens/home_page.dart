import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/screens/add_todo_page.dart';
import 'package:todoapp/service/todo_service.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TodoService _todoService = TodoService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(backgroundColor: Colors.lightBlueAccent),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.grid_view),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ToDoPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All ToDos",
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<TodoService>(builder: (context, todoProvider, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoProvider.todoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("${todoProvider.todoList[index].title}"),
                        subtitle: Text("${todoProvider.todoList[index].body}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {

                              },
                              icon: Icon(
                                Icons.edit,
                              ),
                            ),
                            IconButton(
                              onPressed: () {

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Delete Todo"),
                                      content: Text("Really want to delete ?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Close the dialog
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {

                                            setState(() {
                                              todoProvider.removeTodo(index);
                                            });
                                            // Close the dialog
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Delete"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
