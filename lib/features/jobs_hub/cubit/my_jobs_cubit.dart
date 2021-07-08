import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/applications_notifier/applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/applied_job.dart';
import 'package:meta/meta.dart';
part 'my_jobs_state.dart';

class MyJobsCubit extends Cubit<MyJobsState> {
  final ApplicationsNotifierRepository applicationsNotifierRepository;
  MyJobsCubit(this.applicationsNotifierRepository) : super(MyJobsInitial());

  Future fetchMyApplications(String userId) async {
    var applicationsList;
    emit(FetchMyApplicationsInProgress());
    try {
      applicationsList = await applicationsNotifierRepository
          .getUserJobApplications(userId: userId);
    } on Exception {
      emit(FetchMyApplicationsFailure('FAIL'));
      return null;
    }

    if (applicationsList == null) {
      emit(FetchMyApplicationsFailure('EMPTY OBJECT'));
      return null;
    }

    emit(FetchMyApplicationsSuccess(applications: applicationsList));
  }
}
