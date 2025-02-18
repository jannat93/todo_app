import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/todo_service.dart';

final serviceProvider=StateProvider<TodoService>((ref){
  return TodoService();

});

final fetchStreamProvider=StreamProvider<List<ToDoModel>>((ref)async* {
  final getData=FirebaseFirestore.instance
      .collection('ToDoApp')
      .snapshots()
      .map((event)=>event.docs
  .map((snapshot)=>ToDoModel.fromSnapshot(snapshot))
      .toList());
  yield* getData;
});