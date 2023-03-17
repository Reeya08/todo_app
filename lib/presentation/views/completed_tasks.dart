import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task.dart';

import '../services/tasks.dart';

class FetchCompletedTasks extends StatelessWidget {
  const FetchCompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Completed Tasks"),
      ),
      body: StreamProvider.value(
        value: TaskServices().fetchCompletedTasks(),
        initialData: [TaskModel()],
        builder: (context, child) {
          List<TaskModel> _taskList = context.watch<List<TaskModel>>();
          return ListView.builder(
              itemCount: _taskList.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text("Title"),
                  subtitle: Text("Subtitle"),
                );
              });
        },
      ),
    );
  }
}
