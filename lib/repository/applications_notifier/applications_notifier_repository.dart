import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/repository/applications_notifier/i_applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/application.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/applied_job.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/notification.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';

enum NotificationType { application, jobAcceptance }

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
  Future<void> createJobApplicationNotification({
    JobPost jobPost,
    NotificationType type,
    String applierName,
    String applierDescription,
    String applierPhoneNumber,
    String applierId,
    String posterId,
  }) {
    try {
      final notification = NotificationModel(
        notificationType: 'application',
        posterId: posterId,
        applierName: applierName,
        applierDescription: applierDescription,
        applierPhoneNumber: applierPhoneNumber,
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
  Future<List<NotificationModel>> getNotificationsList({String userId}) async {
    try {
      final notificationList = await fireStore
          .collection('users')
          .doc(userId)
          .collection('notifications')
          .get()
          .then((snapshot) {
        if (snapshot.docs.length > 0) {
          return snapshot.docs
              .map((e) => NotificationModel.fromJson(e.data()))
              .toList();
        } else {
          final List<NotificationModel> empty = [];
          return empty;
        }
      });
      print(notificationList);
      return notificationList;
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> acceptCandidateApplication(
      {String jobTitle, String jobPostId, String applierId}) {
    try {
      final notification = NotificationModel(
        notificationType: 'jobAcceptance',
        posterId: '',
        applierName: '',
        applierDescription: '',
        applierPhoneNumber: '',
        applierId: applierId,
        jobTitle: jobTitle,
        jobId: jobPostId,
      );
      final usersCollection = fireStore.collection('users');
      return usersCollection
          .doc(applierId)
          .collection('notifications')
          .add(notification.toJson());
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> addUserJobApplication(
      {String jobPostId, String jobTitle, String userId}) {
    try {
      final now = DateTime.now();

      final dateOfApplication = '${now.day}/${now.month}/${now.year}';
      final appliedJob = AppliedJob(
          jobTitle: jobTitle,
          dateOfApplication: dateOfApplication,
          accepted: false);
      final usersCollection = fireStore.collection('users');
      return usersCollection
          .doc(userId)
          .collection('applications')
          .add(appliedJob.toJson());
    } on Exception {
      return null;
    }
  }

  @override
  Future<List<AppliedJob>> getUserJobApplications({String userId}) async {
    try {
      final myApplicationsList = await fireStore
          .collection('users')
          .doc(userId)
          .collection('applications')
          .get()
          .then((snapshot) {
        if (snapshot.docs.length > 0) {
          return snapshot.docs
              .map((e) => AppliedJob.fromJson(e.data()))
              .toList();
        } else {
          final List<AppliedJob> empty = [];
          return empty;
        }
      });
      print(myApplicationsList);
      return myApplicationsList;
    } on Exception {
      return null;
    }
  }
}
