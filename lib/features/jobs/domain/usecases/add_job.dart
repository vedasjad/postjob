import '../../../../core/usecases/usecases.dart';
import '../../data/models/job.dart';
import '../repositories/jobs_repository.dart';

class AddJob extends UseCaseWithParams<void, AddJobParams> {
  AddJob(this._repository);
  final JobsRepository _repository;

  @override
  Future<void> call(AddJobParams params) async =>
      await _repository.addJob(job: params.job);
}

class AddJobParams {
  const AddJobParams({
    required this.job,
  });

  final Job job;
}
