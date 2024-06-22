import 'package:get/get.dart';
import 'package:postjob/features/jobs/data/models/job.dart';
import 'package:postjob/features/jobs/domain/usecases/add_job.dart';
import 'package:postjob/features/jobs/domain/usecases/delete_job.dart';
import 'package:postjob/features/jobs/domain/usecases/get_jobs_list.dart';
import 'package:postjob/features/jobs/domain/usecases/update_job.dart';

class JobsController extends GetxController {
  final GetJobsList _getJobsList;
  final AddJob _addJob;
  final UpdateJob _updateJob;
  final DeleteJob _deleteJob;

  RxList<Job> jobs = <Job>[].obs;

  JobsController({
    required GetJobsList getJobsList,
    required AddJob addJob,
    required UpdateJob updateJob,
    required DeleteJob deleteJob,
  })  : _addJob = addJob,
        _deleteJob = deleteJob,
        _getJobsList = getJobsList,
        _updateJob = updateJob;

  @override
  void onInit() {
    super.onInit();
    getJobsList();
  }

  void getJobsList() {
    jobs.value = _getJobsList();
  }

  Future<void> addJob(Job job) async {
    await _addJob(AddJobParams(job: job));
    getJobsList();
  }

  Future<void> updateJob(Job job) async {
    await _updateJob(UpdateJobParams(job: job));
    getJobsList();
  }

  Future<void> deleteJob(Job job) async {
    await _deleteJob(DeleteJobParams(job: job));
    getJobsList();
  }
}
