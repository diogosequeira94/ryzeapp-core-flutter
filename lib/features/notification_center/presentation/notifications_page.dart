import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/notification_center/bloc/notifications_bloc.dart';
import 'package:firebaseblocryze/features/notification_center/presentation/notification_details_page.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/notification.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/job_status_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          actions: [
            IconButton(
                icon: Icon(Icons.delete_outline_outlined),
                onPressed: () {
                  _showDeleteNotificationsDialog(context);
                }),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          // bottom: TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.message_outlined)),
          //     Tab(icon: Icon(Icons.watch_later_outlined)),
          //   ],
          // ),
          title: Text('Notifications',
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color)),
        ),
        body: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsFetchInProgress) {
              return Center(
                child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).accentColor),
              );
            } else if (state is NotificationsFetchSuccess) {
              return _buildNotificationsList(state.notificationsList);
            } else if (state is NotificationsFetchFailure) {
              return Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Text('Oops! Sorry but something went wrong'),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  _buildNotificationsList(List notificationsList) {
    return notificationsList.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none,
                      size: 80, color: Colors.black45),
                  const SizedBox(height: 24.0),
                  Text('You have no notifications right now.',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
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
            ),
          )
        : SingleChildScrollView(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: notificationsList.length,
              itemBuilder: (context, index) {
                final NotificationModel notification = notificationsList[index];
                return Card(
                  elevation: 3.0,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                    leading: Icon(Icons.work_outline_rounded, size: 30.0),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
                    title: RichText(
                      text: TextSpan(
                        text: 'Job Application: ',
                        style: TextStyle(fontSize: 16.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${notification.applierName} ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'has just applied to your '),
                          TextSpan(
                              text: '${notification.jobTitle} ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'post!'),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => NotificationDetailsPage(
                                    jobTitle: notification.jobTitle,
                                    jobId: notification.jobId,
                                    applierName: notification.applierName,
                                    applierDescription:
                                        notification.applierDescription,
                                    applierPhoneNumber:
                                        notification.applierPhoneNumber,
                                    applierId: notification.applierId,
                                  )));
                    },
                  ),
                );
              },
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

  Widget _tabView(BuildContext context) {
    return TabBarView(
      children: [
        _buildNotificationsList(null),
        _buildNotificationMock(context),
      ],
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
