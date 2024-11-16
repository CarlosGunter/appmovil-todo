import 'package:flutter/material.dart';
import '../services/crud.dart';
import 'tile_todo.dart';
import 'dialog.dart';

class ListTodo extends StatefulWidget {
  const ListTodo({super.key});

  @override
  State<ListTodo> createState() => ListTodoState();
}

class ListTodoState extends State<ListTodo> {
  Color primaryColor = Colors.purple;

  void refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTodos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (!snapshot.hasData) {
          return const Center(child: Text('Sin tareas!!'));
        } else if (snapshot.hasError) {
          return const ModalDialog(title: 'Error' ,content: 'Algo salio mal :(');
        } else {
          return BuildList(data: snapshot.data ?? [], refreshList: refreshList);
        }
      },
    );
  }
}

class BuildList extends StatefulWidget {
  final List data;
  final Function() refreshList;
  const BuildList({ super.key, required this.data, required this.refreshList });

  @override
  State<BuildList> createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  late List data;
  @override
  void initState() {
    super.initState();
    data = widget.data;
    // Group the data by status
    data.sort((a, b) => a['status'] ? 1 : -1);
  }

  void removeItem(String id) {
    setState(() {
      data.removeWhere((element) => element['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Change the ListView.builder to ReorderableListView.builder
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TileTodo(
            key: Key(widget.data[i]['id']),
            index: i,
            data: widget.data[i] as Map<String, dynamic>,
            removeItem: removeItem,
            refreshList: widget.refreshList,
          ),
        );
      },
    );
  }
}

