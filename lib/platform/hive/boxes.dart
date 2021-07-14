import 'package:firebaseblocryze/platform/hive/model/job_post_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<JobPostModel> getJobs() => Hive.box<JobPostModel>('jobs');
}
