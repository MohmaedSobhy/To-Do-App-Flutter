import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/task.dart';

// ignore: must_be_immutable
class TaskItem extends StatelessWidget {
  TaskItem({
    super.key,
    required this.task,
    this.checkIconColor,
    this.archivedIconColor,
    required this.doneTaskFunction,
    required this.archivedTaskFunction,
  });

  final Task task;
  Color? checkIconColor;
  Color? archivedIconColor;
  final VoidCallback doneTaskFunction;
  final VoidCallback archivedTaskFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.5.h, vertical: 1.5.h),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepOrange,
          radius: 7.w,
          child: Text(
            task.time,
            style: TextStyle(color: Colors.white, fontSize: 10.sp),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp)),
            Text(
              task.date,
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
            ),
          ],
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
              onPressed: doneTaskFunction,
              icon: Icon(
                Icons.check,
                color: (checkIconColor == null) ? Colors.black : checkIconColor,
              )),
          IconButton(
              onPressed: archivedTaskFunction,
              icon: Icon(
                Icons.archive,
                color: (archivedIconColor == null)
                    ? Colors.black
                    : archivedIconColor,
              )),
        ]),
      ),
    );
  }
}
