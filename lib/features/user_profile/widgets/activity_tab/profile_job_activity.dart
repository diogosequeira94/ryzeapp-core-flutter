import 'package:firebaseblocryze/features/user_profile/utils/activity_jobs_mocks.dart';
import 'package:flutter/material.dart';

class ProfileJobActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Job Activity',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          _JobActivityList(),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}

class _JobActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activityJobsList = ActivityJobsMocks.getMockActivityJobs();
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: activityJobsList.length,
      itemBuilder: (context, index) {
        final jobDetail = activityJobsList[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 70,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    color: _getJobColor(jobDetail.category),
                    width: 70,
                    height: 70,
                    child: _getJobIcon(jobDetail.category),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(jobDetail.jobName,
                            style: TextStyle(color: Colors.black87, fontSize: 15.0)),
                        Text(
                          jobDetail.jobTitle,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(jobDetail.date,style: TextStyle(color: Colors.black54)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Icon _getJobIcon(String category) {
    switch (category) {
      case 'Bar':
        return Icon(Icons.local_drink, color: Colors.white);
      case 'Restaurant':
        return Icon(Icons.restaurant, color: Colors.white);
      default:
        return Icon(Icons.person_outlined, color: Colors.white);
    }
  }

  Color _getJobColor(String category) {
    switch (category) {
      case 'Bar':
        return Colors.deepPurpleAccent;
      case 'Restaurant':
        return Colors.red;
      default:
        return Colors.blueAccent;
    }
  }
}
