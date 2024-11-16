import 'package:flutter/material.dart';
import 'modal_todo.dart';
import 'list_todo.dart';

class CreateTodo extends StatelessWidget {
  final GlobalKey<ListTodoState> listTodoKey;
  const CreateTodo({super.key, required this.listTodoKey});

  final Color primaryColor = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          builder: (BuildContext context) { return const ModalTodo(newTodo: true,); },
          backgroundColor: Colors.transparent,
        );
        // Refresh the list
        listTodoKey.currentState?.refreshList();
      },
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
