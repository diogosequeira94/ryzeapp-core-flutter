import 'package:firebaseblocryze/features/user_profile/model/job_details_card_model.dart';

class ActivityJobsMocks {
  static List<JobDetailsCardModel> getMockActivityJobs() {
    return [
      JobDetailsCardModel('Lux Bar Lisbon', 'Bartender', 'Bar', '21/06/2021'),
      JobDetailsCardModel(
          'Tagliatelle', 'Kitchen Porter', 'Restaurant', '19/06/2021'),
    ];
  }
}
