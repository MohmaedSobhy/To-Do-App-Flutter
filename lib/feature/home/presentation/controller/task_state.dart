part of 'task_cubit.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class AddTaskSuccess extends TaskState {}

class AddTaskError extends TaskState {}

class DeleteTaskSuccess extends TaskState {}

class DeleteTaskError extends TaskState {}

class GetAllTodoTaskes extends TaskState {}

class UpdateTaskSuccess extends TaskState {}

class UpdateTaskError extends TaskState {}

class GetAllArchivedTasks extends TaskState {}

class GetAllDoneTaskes extends TaskState {}
