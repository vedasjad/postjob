import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:postjob/bindings.dart';
import 'package:postjob/core/enums/enums.dart';
import 'package:postjob/features/jobs/data/models/job.dart';

import 'features/jobs/presentation/controllers/job_post_controller.dart';
import 'features/jobs/presentation/screens/job_post_screen/job_post_screen.dart';
import 'features/jobs/presentation/screens/jobs_screen/jobs_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(JobTypeAdapter());
  Hive.registerAdapter(JobLocationAdapter());
  Hive.registerAdapter(CurrencyAdapter());
  Hive.registerAdapter(SalaryAdapter());
  Hive.registerAdapter(JobAdapter());
  await Hive.openBox<Job>('jobsBox');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: '/',
      initialBinding: PostJobsBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const JobsScreen(),
          children: [
            GetPage(
              name: '/job-post',
              page: () => JobPostScreen(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => JobPostController());
              }),
            ),
          ],
        ),
      ],
      home: const JobsScreen(),
    );
  }
}
