import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'feature/home/presentation/controller/task_cubit.dart';
import 'feature/home/presentation/screens/home_page.dart';
import 'feature/splash/presentation/screen/welcome_page.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
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
              useMaterial3: false),
          routes: {
            HomePage.id: (context) => const HomePage(),
          },
        );
      }),
    );
  }
}
