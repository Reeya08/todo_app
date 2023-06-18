// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../../models/task.dart';
//  // Assuming you have a TaskModel class defined
//
// class CompletedTasksScreen extends StatelessWidget {
//   Stream<List<TaskModel>> fetchCompletedTasks() {
//     return FirebaseFirestore.instance
//         .collection('tasks')
//         .where('isCompleted', isEqualTo: true)
//         .snapshots()
//         .map((list) => list.docs
//         .map((e) => TaskModel.fromJson(e.data() as Map<String, dynamic>))
//         .toList());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Completed Tasks'),
//       ),
//       body: StreamBuilder<List<TaskModel>>(
//         stream: fetchCompletedTasks(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final completedTasks = snapshot.data!;
//           return ListView.builder(
//             itemCount: completedTasks.length,
//             itemBuilder: (context, index) {
//               final task = completedTasks[index];
//               return ListTile(
//                 title: Text(task.title),
//                 subtitle: Text(task.description),
//                 // You can display other properties of the TaskModel here
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
