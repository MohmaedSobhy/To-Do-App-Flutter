import 'package:flutter/material.dart';
import 'package:to_do_app_v1/cubit/task_cubit.dart';
import 'package:to_do_app_v1/pages/archived_task_page.dart';
import 'package:to_do_app_v1/pages/done_task.dart';
import 'package:to_do_app_v1/pages/todo_task_page.dart';
import '../views/bottom_sheet.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentScreen = 0;

  List<Widget> screens = const [
    ToDoTask(),
    DoneTask(),
    ArchivedTasks(),
  ];
  bool isBottomSheet = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "To Do",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: screens[currentScreen],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: (value) {
            setState(() {
              currentScreen = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Task",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: "Done"),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: "Archived"),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!isBottomSheet) {
            isBottomSheet = true;
            scaffoldKey.currentState!.showBottomSheet((context) {
              return WillPopScope(
                  onWillPop: () async {
                    isBottomSheet = false;
                    return true;
                  },
                  child: Form(key: formkey, child: const BottomSheetItem()));
            });
          } else {
            if (formkey.currentState!.validate()) {
              isBottomSheet = false;
              TaskCubit.get(context).addNewTask();
              Navigator.of(context).pop();
            }
          }
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
