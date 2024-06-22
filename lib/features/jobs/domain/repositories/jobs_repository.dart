import '../../data/models/job.dart';

abstract class JobsRepository {
  const JobsRepository();

  Future<void> addJob({
    required Job job,
  });

  Future<void> updateJob({
    required Job job,
  });

  Future<void> deleteJob({
    required Job job,
  });

  List<Job> getJobsList();
}
