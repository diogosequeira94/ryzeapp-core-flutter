import 'package:cloud_firestore/cloud_firestore.dart';

import 'job_post.dart';

/// Creating this model class to store both jobsList and a last job, that needs to be used for pagination.
class JobPostListObject {
  final List<JobPost> jobsList;
  final DocumentSnapshot lastJob;

  const JobPostListObject(this.jobsList, this.lastJob);
}
