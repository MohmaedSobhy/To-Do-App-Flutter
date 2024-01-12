import 'package:to_do_app_v1/core/utils/services/local_data.dart';

class Task {
  final int id;
  final String title;
  final String time;
  final String date;
  final String status;

  Task(
      {required this.id,
      required this.title,
      required this.time,
      required this.status,
      required this.date});

  factory Task.fromMap(dynamic data) {
    return Task(
        id: data[columnId],
        title: data[columnTitle],
        time: data[columnTime],
        status: data[columnStatus],
        date: data[columnDate]);
  }
}
