import 'package:cloud/widgets/create_todo.dart';
import 'package:flutter/material.dart';
import '../widgets/list_todo.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final GlobalKey<ListTodoState> listTodoKey = GlobalKey();

  final Color primaryColor = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
        backgroundColor: primaryColor,
      ),
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.fill,
              alignment: Alignment.center,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            ),
          ),
          child: ListTodo(key: listTodoKey),
      ),
      floatingActionButton: CreateTodo(listTodoKey: listTodoKey,),
    );
  }

}



