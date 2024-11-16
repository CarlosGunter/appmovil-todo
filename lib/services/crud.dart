import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List> getTodos() async {
  List items = [];

  try {

    final QuerySnapshot data = await firestore.collection('todo').get();
    for (var doc in data.docs) {
      var todo = { ...doc.data() as Map<String, dynamic>, 'id': doc.id };
      items.add(todo);
    }

  } catch (e) { rethrow; }

  return items;
}

Future<void> newTodo(String title, String content, bool status) async {
  try {
    await firestore.collection('todo').add({
      'title': title,
      'content': content,
      'status': status,
    });
  } catch (e) { rethrow; }
}

Future<void> deleteTodo(String id) async {
  try {
    await firestore.collection('todo').doc(id).delete();
  } catch (e) { rethrow; }
}

Future<void> updateTodo(String id, String title, String content, bool status) async {
  final Map<String, dynamic> newData = {
    'title': title,
    'content': content,
    'status': status,
  };

  try {
    await firestore.collection('todo').doc(id).update(newData);
  } catch (e) { rethrow; }
}

Future<void> toggleStatus(String id, bool status) async {
  try {
    await firestore.collection('todo').doc(id).update({
      'status': !status,
    });
  } catch (e) { rethrow; }
}