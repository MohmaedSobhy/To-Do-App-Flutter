import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_v1/services/local_data.dart';
import '../../data/models/task.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  List<Task> todoTasks = [];
  List<Task> doneTasks = [];
  List<Task> archivedTask = [];

  static TaskCubit get(context) {
    return BlocProvider.of(context);
  }

  void addNewTask() async {
    await AppData.insertDB({
      'title': title.text,
      'time': time.text,
      'date': date.text,
      'status': 'todo'
    }).then((value) {
      title.text = '';
      time.text = '';
      date.text = '';
      emit(AddTaskSuccess());
    }).catchError((error) {
      emit(AddTaskError());
    });
  }

  updateTask({required Task task, required String status}) async {
    await AppData.updateDB(task: task, status: status).then((value) {
      emit(UpdateTaskSuccess());
    }).catchError((error) {
      emit(UpdateTaskError());
    });
  }

  getListofTodoTask() async {
    todoTasks = await AppData.getAllToDoTask();
    emit(GetAllTodoTaskes());
  }

  getListofArchivedTask() async {
    archivedTask = await AppData.getAllArchivedTask();
    emit(GetAllArchivedTasks());
  }

  getListofDoneTask() async {
    doneTasks = await AppData.getAllDoneTask();
    emit(GetAllDoneTaskes());
  }
}
