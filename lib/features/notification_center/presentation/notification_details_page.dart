import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationDetailsPage extends StatelessWidget {
  final String jobTitle, jobId;
  final String applierName, applierId, applierDescription, applierPhoneNumber;

  NotificationDetailsPage({
    @required this.jobTitle,
    @required this.jobId,
    @required this.applierName,
    @required this.applierDescription,
    @required this.applierPhoneNumber,
    @required this.applierId,
  });
  @override
  Widget build(BuildContext context) {
    final _jobsBloc = context.watch<JobsBloc>();
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
        body: BlocListener<JobsBloc, JobsState>(
          listener: (context, state) {
            if (state is JobAcceptanceFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Oops, something went wrong!')),
                );
            } else if (state is JobAcceptanceSuccess) {
              _jobsBloc.add(FetchJobsPosts());
              Navigator.pop(context);
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _NotificationHeader(jobTitle, applierName),
                  const SizedBox(height: 30.0),
                  _UserDetailsSection(applierName, applierDescription,
                      applierPhoneNumber, applierId),
                  const SizedBox(height: 30.0),
                  _DetailedSection(jobTitle, applierName),
                  const SizedBox(height: 50.0),
                  BlocBuilder<JobsBloc, JobsState>(builder: (context, state) {
                    return RyzePrimaryButton(
                      title: 'Accept',
                      action: () {
                        _jobsBloc.add(AcceptJobPressed(
                          jobTitle: jobTitle,
                          jobId: jobId,
                          applierId: applierId,
                        ));
                      },
                      isLoading: state is JobAcceptanceInProgress,
                      isAffirmative: true,
                    );
                  })
                ],
              ),
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
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Job Application',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '${applierName.trimRight()} has submitted a job application to your job post. \n\nBefore deciding weather to accept the application you can find more details below.',
          style: TextStyle(
            fontSize: 16.0,
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
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Icon(Icons.work_outline),
              const SizedBox(width: 5.0),
              Flexible(
                child: Text(
                  'Job Preview',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Title: $jobTitle',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          'Description: Some Description',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          'Date: 05/07/2021',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 18.0),
        RichText(
          text: TextSpan(
            text: 'You can check full job details by clicking ',
            style: TextStyle(fontSize: 16.0,color: Theme.of(context).textTheme.headline6.color),
            children: <TextSpan>[
              TextSpan(
                  text: 'here.',
                  recognizer: TapGestureRecognizer()..onTap = () {},
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

class _UserDetailsSection extends StatelessWidget {
  final String applierName;
  final String applierDescription;
  final String applierPhone;
  final String applierId;

  const _UserDetailsSection(this.applierName, this.applierDescription,
      this.applierPhone, this.applierId);

  @override
  Widget build(BuildContext context) {
    final description = applierDescription.isEmpty ? 'Not provided' : applierDescription;
    final contact = applierPhone.isEmpty ? 'Not provided' : applierPhone;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Icon(Icons.person_outline),
              const SizedBox(width: 5.0),
              Flexible(
                child: Text(
                  'Applier Details',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'About: $description',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          'Contact: $contact',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 18.0),
        RichText(
          text: TextSpan(
            text:
                'You can check ${applierName.trimRight()} full profile by clicking ',
            style: TextStyle(fontSize: 16.0, color: Theme.of(context).textTheme.headline6.color),
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
