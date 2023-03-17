import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task.dart';

import '../services/tasks.dart';

class FetchInCompletedTasks extends StatelessWidget {
  const FetchInCompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Incompleted Tasks"),
      ),
      body: StreamProvider.value(
        value: TaskServices().fetchInCompletedTasks(),
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
