import 'package:flutter/material.dart';

Future<void> dialog (BuildContext context, String title, String content) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return ModalDialog(title: title, content: content);
    },
  );
}

class ModalDialog extends StatelessWidget {
  final String title;
  final String content;
  const ModalDialog({ super.key, required this.title, required this.content });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}

