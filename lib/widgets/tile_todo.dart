import 'package:flutter/material.dart';
import '../services/crud.dart';
import 'modal_todo.dart';
import 'dialog.dart';

class TileTodo extends StatefulWidget {
  final int index;
  final Map<String, dynamic> data;
  final Function(String) removeItem;
  final Function() refreshList;

  const TileTodo({
    required Key key,
    required this.index,
    required this.data,
    required this.removeItem,
    required this.refreshList,
  }) : super(key: key);

  @override
  State<TileTodo> createState() => _TileTodoState();
}

class _TileTodoState extends State<TileTodo> {
  final Color primaryColor = Colors.purple.shade800;
  late String id;
  late String title;
  late String content;
  late bool status;

  @override
  void initState() {
    super.initState();
    id = widget.data['id'];
    title = widget.data['title'];
    content = widget.data['content'];
    status = widget.data['status'];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: widget.key,
      // TODO: Add date after title
      title: Text(title),
      subtitle: Text(content),
      leading: IconButton(
        onPressed: () async {
          await toggleStatus(id, status).onError(
                (error, stackTrace) { dialog(context, 'Error', 'Algo salio mal :('); },
          );
          setState(() { status = !status; });
        },
        icon: status
            ? Icon(
              Icons.check,
              color: primaryColor,
            )
            : const Icon(
              Icons.access_time,
              color: Colors.orange,
            ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.white54,),
        onPressed: () async {
          await deleteTodo(id).onError(
                (error, stackTrace) { dialog(context, 'Error', 'Algo salio mal :('); },
          );
          // Update the list
          widget.removeItem(id);
        },
      ),
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return ModalTodo(data: widget.data);
          },
          backgroundColor: Colors.transparent,
        );
        widget.refreshList();
      },
    );
  }
}
