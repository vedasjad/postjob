import '../../domain/repositories/jobs_repository.dart';
import '../datasources/jobs_local_data_source.dart';
import '../models/job.dart';

class JobsRepositoryImpl implements JobsRepository {
  JobsRepositoryImpl(this._jobsLocalDataSource);
  final JobsLocalDataSource _jobsLocalDataSource;

  @override
  Future<void> addJob({
    required Job job,
  }) async {
    await _jobsLocalDataSource.addJob(
      job: job,
    );
  }

  @override
  Future<void> deleteJob({
    required Job job,
  }) async {
    _jobsLocalDataSource.deleteJob(job: job);
  }

  @override
  Future<void> updateJob({
    required Job job,
  }) async {
    _jobsLocalDataSource.updateJob(
      job: job,
    );
  }

  @override
  List<Job> getJobsList() {
    List<Job> jobModelsList = _jobsLocalDataSource.getJobsList();
    return jobModelsList;
  }
}
