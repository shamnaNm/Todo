import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/service/todo_service.dart';

import 'package:todoapp/models/todo_model.dart';

import 'package:todoapp/widget/customtextformfield.dart';
import '../widget/appbutton.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  final _todopagekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return Consumer<TodoService>(builder: (context, todoProvider, child) {
      return Scaffold(
        appBar: AppBar(
          leading: Center(child: Text(" Add new List",textAlign: TextAlign.start,)),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _todopagekey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _title,
                  hintText: "Enter a Tiltle",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Title is mandatory";
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  controller: _description,
                  hintText: "Enter a Description",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Description is mandatory";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                    height: 48,
                    width: 250,
                    color: Colors.lightBlueAccent,
                    onTap: () {
                      if (_todopagekey.currentState!.validate()) {
                        ToDoModel todo = ToDoModel(
                            title: _title.text, body: _description.text);

                        todoProvider.addTodo(todo);
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Save",style: TextStyle(color: Colors.white),)),
              ],
            ),

          ),
        ),
      );
    });

  }


}
