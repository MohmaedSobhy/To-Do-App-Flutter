import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_v1/feature/home/presentation/controller/task_cubit.dart';
import '../../data/models/task.dart';
import '../widgets/list_empty.dart';
import '../widgets/task_item.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        TaskCubit.get(context).getListofArchivedTask();
        List<Task> listofArchivedTasks = TaskCubit.get(context).archivedTask;
        return (listofArchivedTasks.isEmpty)
            ? const CustomeEmptyList(
                message: "Archived Empty", iconData: Icons.archive)
            : ListView.separated(
                itemCount: listofArchivedTasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    task: listofArchivedTasks[index],
                    archivedTaskFunction: () {
                      TaskCubit.get(context).updateTask(
                          task: listofArchivedTasks[index], status: "todo");
                    },
                    doneTaskFunction: () {
                      TaskCubit.get(context).updateTask(
                          task: listofArchivedTasks[index], status: "done");
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 1,
                    endIndent: 1,
                  );
                },
              );
      },
    );
  }
}
