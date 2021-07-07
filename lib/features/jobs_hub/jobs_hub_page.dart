import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/job_status_pill.dart';
import 'package:flutter/material.dart';

class JobsHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.list),
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 3.0,
            tabs: [
              Tab(
                  child: Text(
                'Active',
                style: TextStyle(
                  fontSize: 16.0,
                    color: Theme.of(context).textTheme.headline6.color),
              )),
              Tab(
                  child: Text(
                'Referrals',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).textTheme.headline6.color),
              )),
            ],
          ),
          title: Text('Jobs Hub',
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color)),
        ),
        body: TabBarView(
          children: [
            _buildActiveList(),
            _buildActiveList(),
          ],
        ),
      ),
    );
  }

  _buildActiveList() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.work_off_outlined, size: 80, color: Colors.black45),
            const SizedBox(height: 24.0),
            Text('You have no active jobs ongoing.',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
            const SizedBox(height: 8.0),
            Text(
                'When you have jobs updates or posts, everything will be displayed here.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  _showDeleteNotificationsDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      width: 350,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.NO_HEADER,
      title: 'Delete Notifications',
      desc:
          'Are you sure you want to delete all notifications? You can choose to delete each one by longpressing an entry.',
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      btnCancelText: 'Go back',
      btnCancelColor: Colors.black,
      btnOkText: 'Delete',
      btnOkColor: Colors.red,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
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
              title: Text('Mock'),
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
        Divider(
          height: 1.0,
        ),
      ],
    );
  }
}
