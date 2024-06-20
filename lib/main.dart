import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/jobs/presentation/job_post_screen/job_post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Post Job',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Jost',
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const JobPostScreen(),
    );
  }
}
