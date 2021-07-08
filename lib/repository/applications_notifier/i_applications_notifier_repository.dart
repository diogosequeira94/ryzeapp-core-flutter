import 'package:firebaseblocryze/repository/applications_notifier/model/applied_job.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/notification.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:meta/meta.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/application.dart';

abstract class IApplicationsNotifierRepository {
  Future<void> submitJobApplication(
      {@required String jobPostId, Application jobApplication});
  Future<void> acceptCandidateApplication({
    @required String jobTitle,
    String jobPostId,
    String applierId,
  });
  Future<void> addUserJobApplication({
    @required String jobPostId,
    @required String jobTitle,
    @required String userId,
  });

  Future<List<AppliedJob>> getUserJobApplications({
    @required String userId,
  });

  Future<void> createJobApplicationNotification({
    JobPost jobPost,
    String applierName,
    String applierDescription,
    String applierPhoneNumber,
    String applierId,
    String posterId,
  });
  Future<List<NotificationModel>> getNotificationsList(
      {@required String userId});
  Future<void> deleteApplication({@required String applicationId});
}
