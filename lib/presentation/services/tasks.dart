import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/task.dart';

class TaskServices {
  /*Future: because we have to wait for this function
  model because the data is of the type task model
  async used when future datatype is used
  */

  final CollectionReference taskCollection =
      FirebaseFirestore.instance.collection("taskCollection");

  Future addTask(TaskModel model) async {
    // //waitint for initializing the the Firebase database
    //  return await FirebaseFirestore.instance
    //  //go to the database table "taskCollection"
    //      .collection("taskCollection")
    //  //add the task from the model to firebase in the Json format because database understang Json
    //      .add(model.toJson());
    DocumentReference ref = taskCollection.doc();
    return await ref.set(model.toJson(ref.id));
  }

  Stream<List<TaskModel>> fetchTasks() {
      return taskCollection.snapshots().map((list) => list.docs
        .map((e) => TaskModel.fromJson(e.data() as Map<String, dynamic>))
        .toList());
  }

  Future updateTask({required String taskID, required String title, required String description}) async {
    return await taskCollection.doc(taskID).update({
      "taskTitle": title,
      "description": description,
    });
  }

  Future deleteTask(String TaskID) async {
    return await taskCollection.doc(TaskID).delete();
  }

  Stream<List<TaskModel>> fetchCompletedTasks() {
    return taskCollection.where('isCompleted', isEqualTo: true).snapshots().map(
        (list) => list.docs
            .map((e) => TaskModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  Stream<List<TaskModel>> fetchInCompletedTasks() {
    return taskCollection
        .where('isCompleted', isEqualTo: false)
        .snapshots()
        .map((list) => list.docs
            .map((e) => TaskModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }
}
