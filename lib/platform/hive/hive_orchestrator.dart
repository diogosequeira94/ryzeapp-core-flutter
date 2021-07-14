import 'package:firebaseblocryze/platform/hive/boxes.dart';
import 'package:firebaseblocryze/platform/hive/model/job_post_model.dart';

class HiveOrchestrator {
  bool exists(String id) {
    final box = Boxes.getJobs();
    return box.keys.contains(id);
  }

  Future addPost(
      {String id,
      String title,
      String posterName,
      String description,
      String location,
      String payRate}) async {
    final jobPost = JobPostModel()
      ..id = id
      ..title = title
      ..posterName = posterName
      ..description = description
      ..location = location
      ..payRate = payRate;

    final box = Boxes.getJobs();
    final jobsList = box.keys.toList().toString();
    print(jobsList);
    box.put(id, jobPost);
    print('JOB ADDED');
    // box.put('myKey', value);
  }

  void deletePost(String id) {
    final box = Boxes.getJobs();
    box.delete(id);
    print('JOB DELETED');
  }
}
