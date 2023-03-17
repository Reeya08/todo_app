import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/presentation/services/tasks.dart';

class DeleteTask extends StatefulWidget {
  const DeleteTask({super.key, required TaskModel taskModel})
      : _taskModel = taskModel;

  final TaskModel _taskModel;

  @override
  State<DeleteTask> createState() => _DeleteTaskState();
}

class _DeleteTaskState extends State<DeleteTask> {
  late TextEditingController nameController;

  late TextEditingController descriptionController;
  final TaskServices _taskServices = TaskServices();
  bool isLoading = false;

  @override
  void initState() {
    nameController =
        TextEditingController(text: widget._taskModel.taskTitle ?? '');
    descriptionController =
        TextEditingController(text: widget._taskModel.description ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
          title: const Text(
            'Delete Task',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    elevation: 5,
                  ),
                  onPressed: () async {
                    setLoadingTrue();
                    await _taskServices
                        .deleteTask(
                       widget._taskModel.taskId ?? '37943',
                        )
                        .then((value) {
                      nameController.clear();
                      descriptionController.clear();
                      FocusManager.instance.primaryFocus!.unfocus();
                      setLoadingFalse();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Task Deleted Successfully.')));
                    }).onError((error, stackTrace) {
                      nameController.clear();
                      descriptionController.clear();
                      setLoadingFalse();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(error.toString()),
                        backgroundColor: Colors.red,
                      ));
                    });
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  setLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }
}
