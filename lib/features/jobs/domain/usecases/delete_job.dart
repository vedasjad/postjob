import '../../../../core/usecases/usecases.dart';
import '../../data/models/job.dart';
import '../repositories/jobs_repository.dart';

class DeleteJob extends UseCaseWithParams<void, DeleteJobParams> {
  DeleteJob(this._repository);
  final JobsRepository _repository;

  @override
  Future<void> call(DeleteJobParams params) async =>
      await _repository.deleteJob(job: params.job);
}

class DeleteJobParams {
  const DeleteJobParams({
    required this.job,
  });

  final Job job;
}
