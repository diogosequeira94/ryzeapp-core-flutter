import 'package:firebaseblocryze/repository/applications_notifier/model/notification.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:meta/meta.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/application.dart';

abstract class IApplicationsNotifierRepository {
  Future<void> submitJobApplication(
      {@required String jobPostId, Application jobApplication});
  Future<void> createInAppNotification(
      {JobPost jobPost, String userId, String posterId});
  Future<List<Notification>> getNotificationsList({@required String userId});
  Future<void> deleteApplication({@required String applicationId});
}
