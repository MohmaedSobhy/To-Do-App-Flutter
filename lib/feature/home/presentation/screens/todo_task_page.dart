import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_v1/constans.dart';
import 'package:to_do_app_v1/feature/home/presentation/controller/task_cubit.dart';
import 'package:to_do_app_v1/widgets/list_empty.dart';
import '../../data/models/task.dart';
import '../../../../widgets/task_item.dart';

class ToDoTask extends StatelessWidget {
  const ToDoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        TaskCubit.get(context).getListofTodoTask();
        List<Task> listofTodoTasks = TaskCubit.get(context).todoTasks;
        return (listofTodoTasks.isEmpty)
            ? const CustomeEmptyList(
                message: "Add New Tasks", iconData: Icons.menu)
            : ListView.separated(
                itemCount: listofTodoTasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    task: listofTodoTasks[index],
                    archivedTaskFunction: () {
                      TaskCubit.get(context).updateTask(
                          task: listofTodoTasks[index], status: archivedStatus);
                    },
                    doneTaskFunction: () {
                      TaskCubit.get(context).updateTask(
                          task: listofTodoTasks[index], status: doneStatus);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 1,
                    endIndent: 1,
                  );
                });
      },
    );
  }
}
