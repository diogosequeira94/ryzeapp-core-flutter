import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/repository/applications_notifier/i_applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/application.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/notification.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';

class ApplicationsNotifierRepository extends IApplicationsNotifierRepository {
  final FirebaseFirestore fireStore;
  final FirebaseStorage firebaseStorage;
  ApplicationsNotifierRepository({this.fireStore, this.firebaseStorage});

  @override
  Future<void> deleteApplication({String jobPostId, String applicationId}) {
    final jobsCollection = fireStore.collection('jobs');
    return jobsCollection
        .where('jobID', isEqualTo: jobPostId)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        fireStore.collection('applications').doc(applicationId).delete();
      });
    });
  }

  @override
  Future<void> submitJobApplication(
      {String jobPostId, Application jobApplication}) {
    try {
      final jobsCollection = fireStore.collection('jobs');
      return jobsCollection
          .doc(jobPostId)
          .collection('applications')
          .add(jobApplication.toJson());
    } on Exception {
      return null;
    }
  }

  // Split in the future into a different repository
  @override
  Future<void> createInAppNotification({
    JobPost jobPost,
    String applierName,
    String applierId,
    String posterId,
  }) {
    try {
      final notification = NotificationModel(
        posterId: posterId,
        applierName: applierName,
        applierId: applierId,
        jobTitle: jobPost.title,
        jobId: jobPost.jobID,
      );
      final usersCollection = fireStore.collection('users');
      return usersCollection
          .doc(posterId)
          .collection('notifications')
          .add(notification.toJson());
    } on Exception {
      return null;
    }
  }

  @override
  Future<List<NotificationModel>> getNotificationsList({String userId}) {
    try {
      final notificationList = fireStore
          .collection('users')
          .doc(userId)
          .collection('notifications')
          .get()
          .then((snapshot) {
            final length = snapshot.docs.length;
            print('##### NOTIFICAITONS LIST LENGTH $length');
            if(snapshot.docs.length > 0 ) {
              snapshot.docs.map((e) => NotificationModel.fromJson(e.data())).toList();
            } else {
              final List<NotificationModel> empty = [];
              return empty;
            }
      });

      return notificationList;
    } on Exception {
      return null;
    }
  }
}
