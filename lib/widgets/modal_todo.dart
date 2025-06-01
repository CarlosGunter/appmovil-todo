import 'package:flutter/material.dart';
import '../services/crud.dart';
import 'dialog.dart';

class ModalTodo extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool newTodo;
  const ModalTodo({ super.key, this.data = const {}, this.newTodo = false });
  @override
  State<ModalTodo> createState() => _ModalTodoState();
}

class _ModalTodoState extends State<ModalTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  late bool statusState;
  late String id;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.data['title'] ?? '';
    contentController.text = widget.data['content'] ?? '';
    statusState = widget.data['status'] ?? false;
    id = widget.data['id'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.withValues(alpha: 0.6, red: 0, green: 0, blue: 0),
      ),
      child: Column(
        children: [
          // Title
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Titulo', style: TextStyle(fontSize: 18)),
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Nueva tarea',
            ),
          ),
          // Content
          const Padding(
            padding: EdgeInsets.only(top: 18.0, bottom: 0.0),
            child: Text('Descripción', style: TextStyle(fontSize: 18)),
          ),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(
              hintText: 'Entregar proyecto',
            ),
          ),
          // Status
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Estado:  ', style: TextStyle(fontSize: 18)),
                Switch(
                  value: statusState,
                  onChanged: (value) {
                    setState(() {
                      statusState = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
                Text(
                  statusState ? ' Completado' : ' Pendiente',
                  style: TextStyle(color: statusState ? Colors.white : Colors.orange),
                ),
              ],
            ),
          ),
          // TODO: Add Date
          // Button to save
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              onPressed: () async {
                String title = titleController.text;
                String content = contentController.text;
                widget.newTodo
                    ? await newTodo(title, content, statusState).onError(
                      (error, stackTrace) { dialog(context, 'Error', 'Algo salio mal :('); },
                    )
                    : await updateTodo(id, title, content, statusState).onError(
                      (error, stackTrace) { dialog(context, 'Error', 'Algo salio mal :('); },
                    );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text('Listo'),
            ),
          ),
        ],
      ),
    );
  }
}