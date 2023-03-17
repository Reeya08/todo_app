// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

TaskModel taskFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskToJson(TaskModel data) =>
    json.encode(data.toJson(data.taskId.toString()));

class TaskModel {
  TaskModel({
    this.taskId,
    this.taskTitle,
    this.description,
    this.date,
    this.isCompleted,
  });

  String? taskId;
  String? taskTitle;
  String? description;
  Timestamp? date;
  bool? isCompleted;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        taskId: json["taskID"],
        taskTitle: json["taskTitle"],
        description: json["description"],
        date: json["date"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson(String id) => {
        "taskID": id,
        "taskTitle": taskTitle,
        "description": description,
        "date": Timestamp.now(),
        "isCompleted": false,
      };
}
