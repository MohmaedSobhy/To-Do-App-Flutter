import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app_v1/cubit/task_cubit.dart';
import 'package:intl/intl.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: TaskCubit.get(context).title,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter Title";
              }
              TaskCubit.get(context).title.text = value;
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Title",
              hintText: "Task Title",
              prefixIcon: Icon(Icons.title),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            controller: TaskCubit.get(context).date,
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2030-01-01'))
                  .then(
                (datetime) => {
                  TaskCubit.get(context).date.text =
                      DateFormat.yMMM().format(datetime!)
                },
              );
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter Date";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Date",
              hintText: "Date",
              prefixIcon: Icon(Icons.calendar_month),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            controller: TaskCubit.get(context).time,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter Time";
              }
              return null;
            },
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((time) => {
                    TaskCubit.get(context).time.text =
                        time!.format(context).toString(),
                  });
            },
            decoration: const InputDecoration(
              labelText: "Time",
              hintText: "Time",
              prefixIcon: Icon(Icons.watch),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
