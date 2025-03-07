import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoModel {
  String? docID;
  final String titleTask;
  final String description;
  final String category;
  final String dateTask;
  final String timeTask;
  final bool isDone;

  ToDoModel({
    this.docID,
    required this.titleTask,
    required this.description,
    required this.category,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
  });

  // Convert object to JSON (Map)
  Map<String, dynamic> toMap() {
    return <String,dynamic>{
      'titleTask': titleTask,
      'description': description,
      'category': category,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone':isDone,
    };
  }

  // Factory constructor to create object from JSON (Map)
  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      docID: map['docID']!=null ? map['docID'] as String:null,
      titleTask: map['titleTask'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      isDone: map['isDone'] as bool,
    );
  }
  //String toJson()=>json.encode(toMap());
  factory ToDoModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>doc){
    return ToDoModel(
        docID:doc.id,
        titleTask: doc['titleTask'],
        description: doc['description'],
        category: doc['category'],
        dateTask: doc['dateTask'],
        timeTask: doc['timeTask'],
        isDone: doc['isDone'],
    );
  }
}
