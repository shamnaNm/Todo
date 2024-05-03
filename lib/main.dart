import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/screens/home_page.dart';
import 'package:todoapp/service/todo_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TodoService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'todo app',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.lightBlueAccent,
            toolbarTextStyle: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          scaffoldBackgroundColor: Colors.limeAccent,
        ),
        home: TodoListScreen(),
      ),
    );
  }
}
