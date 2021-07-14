import 'package:hive/hive.dart';

part 'job_post_model.g.dart';

@HiveType(typeId: 0)
class JobPostModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String posterName;
  @HiveField(3)
  String description;
  @HiveField(4)
  String location;
  @HiveField(5)
  String payRate;
}
