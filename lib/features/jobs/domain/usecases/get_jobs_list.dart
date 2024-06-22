import 'package:postjob/features/jobs/data/models/job.dart';

import '../../../../core/usecases/usecases.dart';
import '../repositories/jobs_repository.dart';

class GetJobsList extends UseCaseWithoutParams {
  GetJobsList(this._repository);
  final JobsRepository _repository;

  @override
  List<Job> call() => _repository.getJobsList();
}
