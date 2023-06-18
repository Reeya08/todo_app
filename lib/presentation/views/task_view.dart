import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/presentation/views/add_task.dart';
import 'package:to_do_app/presentation/views/completed_tasks.dart';
import 'package:to_do_app/presentation/views/update_task.dart';

import '../services/tasks.dart';
import 'delete_task.dart';

class FetchAllTasks extends StatelessWidget {
  FetchAllTasks({Key? key}) : super(key: key);
  final TaskServices _taskServices = TaskServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My tasks"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTask()));
        },
        child: const Icon(Icons.add),
      ),
      body: StreamProvider.value(
        value: _taskServices.fetchTasks(),
        initialData: [TaskModel()],
        builder: (context, child) {
          try {
            List<TaskModel> _taskList = context.watch<List<TaskModel>>();
            return _taskList.isEmpty
                ? const Center(
              child: Text('No Data'),
            )
                : _taskList[0].taskId == null
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                itemCount: _taskList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(_taskList[i].taskTitle ?? 'If null'),
                    subtitle:
                    Text(_taskList[i].description ?? 'If null'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateTask(
                                            taskModel: _taskList[i],
                                          )));
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeleteTask(
                                          taskModel: _taskList[i],
                                        )));
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } catch (e) {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
