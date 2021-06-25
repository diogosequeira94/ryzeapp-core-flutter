import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/job_status_pill.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.message_outlined, color: Colors.black54)),
              Tab(
                  icon:
                      Icon(Icons.watch_later_outlined, color: Colors.black54)),
            ],
          ),
          title: Text('Notifications',
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color)),
        ),
        body: TabBarView(
          children: [
            _buildNotificationMock(context),
            _buildNotificationDummy(),
          ],
        ),
      ),
    );
  }

  _buildNotificationDummy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none, size: 80, color: Colors.black45),
          const SizedBox(height: 24.0),
          Text('You have no notifications right now.',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
          const SizedBox(height: 8.0),
          Text(
              'When you have job updates, messages or news, it will be showed here.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  _buildNotificationMock(BuildContext context) {
    final jobPost = JobPost(
        jobID: '213213',
        title: 'Mock Job',
        description: 'This is a Mock Job, not Real. Do not Work for free',
        imageUrl: null,
        status: 'Active',
        city: 'Lisbon',
        hourRate: '20€ / hour',
        isRemote: true,
        slotsAvailable: 1,
        languages: ['Portuguese']);
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          child: Card(
            elevation: 3.0,
            child: ListTile(
              title: Text('Job Confirmation: Restaurant'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JobStatusPill(jobStatus: 'Active'),
                ],
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, '/job-confirmation-page',
                    arguments: jobPost);
              },
            ),
          ),
        ),
        Divider(height: 1.0,),
      ],
    );
  }
}
