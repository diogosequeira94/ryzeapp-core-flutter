import 'package:firebaseblocryze/features/notification_center/presentation/notification_details_page.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/notification.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard(this.notification);
  @override
  Widget build(BuildContext context) {
    final isApplication = notification.notificationType == 'application';
    return Card(
      elevation: 3.0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        leading: Icon(Icons.work_outline_rounded, size: 30.0),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
        title: _getNotificationTitle(isApplication),
        onTap: () {
          isApplication
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => NotificationDetailsPage(
                            jobTitle: notification.jobTitle,
                            jobId: notification.jobId,
                            applierName: notification.applierName,
                            applierDescription: notification.applierDescription,
                            applierPhoneNumber: notification.applierPhoneNumber,
                            applierId: notification.applierId,
                          )),
                )
              : Navigator.of(context).pushNamed('/job-confirmation-page',
                  arguments: notification.jobId);
        },
      ),
    );
  }

  Widget _getNotificationTitle(bool isApplication) {
    if (isApplication) {
      return RichText(
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(text: 'post!'),
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          text: 'Confirmation: ',
          style: TextStyle(fontSize: 16.0),
          children: <TextSpan>[
            TextSpan(text: 'You have been accepted for the '),
            TextSpan(
                text: '${notification.jobTitle} ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(text: 'position!'),
          ],
        ),
      );
    }
  }
}
