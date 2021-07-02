import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/repository/applications_notifier/i_applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/application.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
