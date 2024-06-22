import 'package:hive_flutter/hive_flutter.dart';
import 'package:postjob/features/jobs/data/models/job.dart';

abstract class JobsLocalDataSource {
  Box<Job> openDB();
  Future<void> deleteJob({
    required Job job,
  });
  Future<void> addJob({required Job job});
  Future<void> updateJob({required Job job});
  List<Job> getJobsList();
}

class JobsLocalDataSourceImpl implements JobsLocalDataSource {
  late Box<Job> jobsBox;
  JobsLocalDataSourceImpl() {
    jobsBox = openDB();
  }

  @override
  Box<Job> openDB() {
    return Hive.box<Job>('jobsBox');
  }

  @override
  Future<void> addJob({required Job job}) async {
    try {
      await jobsBox.put(job.id, job);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteJob({required Job job}) async {
    await jobsBox.delete(job.id);
  }

  @override
  List<Job> getJobsList() {
    return jobsBox.values.toList();
  }

  @override
  Future<void> updateJob({required Job job}) async {
    await jobsBox.put(job.id, job);
  }
}
