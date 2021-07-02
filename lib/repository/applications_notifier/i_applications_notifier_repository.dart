import 'package:meta/meta.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/application.dart';

abstract class IApplicationsNotifierRepository {
  Future<void> submitJobApplication({@required String jobPostId, Application jobApplication});
  Future<void> deleteApplication({@required String applicationId});
}
