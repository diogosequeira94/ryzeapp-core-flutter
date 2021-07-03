import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class NotificationDetailsPage extends StatelessWidget {
  final String jobTitle, jobId;
  final String applierName, applierId;

  NotificationDetailsPage({
    @required this.jobTitle,
    @required this.jobId,
    @required this.applierName,
    @required this.applierId,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            'Notification Details',
            style:
                TextStyle(color: Theme.of(context).textTheme.headline6.color),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _NotificationHeader(jobTitle, applierName),
                const SizedBox(height: 20.0),
                _DetailedSection(jobTitle, applierName),
                const SizedBox(height: 20.0),
                _UserDetailsSection(applierName, applierId),
                const SizedBox(height: 50.0),
                RyzePrimaryButton(
                  title: 'Accept',
                  action: () {},
                  isAffirmative: true,
                )
              ],
            ),
          ),
        ));
  }
}

class _NotificationHeader extends StatelessWidget {
  final String jobTitle;
  final String applierName;

  const _NotificationHeader(this.jobTitle, this.applierName);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Job Application',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '${applierName.trimRight()} has submitted a job application to your job post. \nBefore deciding weather to accept the application you can check the details below.\n\n After accepting ${applierName.trimRight()} will be notified and you both can start working together at the agreed date and time!',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}

class _DetailedSection extends StatelessWidget {
  final String jobTitle;
  final String applierName;

  const _DetailedSection(this.jobTitle, this.applierName);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Job Preview',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '${applierName.trimRight()} has submitted a job application to your job post. \nBefore deciding weather to accept the application you can check the details below.\n\n After accepting ${applierName.trimRight()} will be notified and you both can start working together at the agreed date and time!',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}

class _UserDetailsSection extends StatelessWidget {
  final String applierName;
  final String applierId;

  const _UserDetailsSection(this.applierName, this.applierId);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Applier Details',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            text:
                'You can check ${applierName.trimRight()} profile by clicking ',
            style: TextStyle(fontSize: 16.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'here.',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushNamed(
                          '/application-profile-preview',
                          arguments: applierId);
                    },
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Theme.of(context).accentColor)),
            ],
          ),
        ),
      ],
    );
  }
}
