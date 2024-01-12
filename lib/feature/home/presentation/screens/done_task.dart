import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_v1/constans.dart';
import 'package:to_do_app_v1/feature/home/presentation/controller/task_cubit.dart';
import '../../data/models/task.dart';
import '../../../../widgets/list_empty.dart';
import '../../../../widgets/task_item.dart';

class DoneTask extends StatelessWidget {
  const DoneTask({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        TaskCubit.get(context).getListofDoneTask();
        List<Task> listofDoneTasks = TaskCubit.get(context).doneTasks;
        return (listofDoneTasks.isEmpty)
            ? const CustomeEmptyList(
                message: "Finish Some Tasks", iconData: Icons.done)
            : ListView.separated(
                itemCount: listofDoneTasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    task: listofDoneTasks[index],
                    archivedTaskFunction: () {
                      TaskCubit.get(context).updateTask(
                          task: listofDoneTasks[index], status: archivedStatus);
                    },
                    doneTaskFunction: () {
                      TaskCubit.get(context).updateTask(
                          task: listofDoneTasks[index], status: toDoStatus);
                    },
                    checkIconColor: Colors.green,
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
