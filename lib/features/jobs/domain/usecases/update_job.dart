import '../../../../core/usecases/usecases.dart';
import '../../data/models/job.dart';
import '../repositories/jobs_repository.dart';

class UpdateJob extends UseCaseWithParams<void, UpdateJobParams> {
  UpdateJob(this._repository);
  final JobsRepository _repository;

  @override
  Future<void> call(UpdateJobParams params) async =>
      await _repository.updateJob(job: params.job);
}

class UpdateJobParams {
  const UpdateJobParams({
    required this.job,
  });

  final Job job;
}
