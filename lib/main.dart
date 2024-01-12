import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app_v1/feature/home/presentation/controller/task_cubit.dart';
import 'package:to_do_app_v1/feature/home/presentation/screens/home_page.dart';
import 'package:to_do_app_v1/feature/splash/presentation/screen/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: const WelcomPage(),
          debugShowMaterialGrid: false,
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
          ),
          routes: {
            HomePage.id: (context) => const HomePage(),
          },
        );
      }),
    );
  }
}
