import 'package:flutter/material.dart';
class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey,),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}