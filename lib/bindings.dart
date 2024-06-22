import 'package:get/get.dart';
import 'package:postjob/features/jobs/data/datasources/jobs_local_data_source.dart';
import 'package:postjob/features/jobs/data/repositories/jobs_repository_impl.dart';
import 'package:postjob/features/jobs/domain/usecases/add_job.dart';
import 'package:postjob/features/jobs/domain/usecases/delete_job.dart';
import 'package:postjob/features/jobs/domain/usecases/get_jobs_list.dart';
import 'package:postjob/features/jobs/domain/usecases/update_job.dart';
import 'package:postjob/features/jobs/presentation/controllers/jobs_controller.dart';

class PostJobsBinding extends Bindings {
  @override
  void dependencies() async {
    final localDataSource = JobsLocalDataSourceImpl();
    final repository = JobsRepositoryImpl(localDataSource);

    Get.lazyPut<GetJobsList>(() => GetJobsList(repository));
    Get.lazyPut<AddJob>(() => AddJob(repository));
    Get.lazyPut<UpdateJob>(() => UpdateJob(repository));
    Get.lazyPut<DeleteJob>(() => DeleteJob(repository));
    Get.lazyPut<JobsController>(
      () => JobsController(
        getJobsList: Get.find(),
        addJob: Get.find(),
        updateJob: Get.find(),
        deleteJob: Get.find(),
      ),
    );
  }
}
