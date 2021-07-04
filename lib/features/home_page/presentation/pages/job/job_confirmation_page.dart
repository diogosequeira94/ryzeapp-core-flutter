import 'package:firebaseblocryze/features/home_page/presentation/widgets/confirmation_page/widgets.dart';
import 'package:firebaseblocryze/features/notification_center/bloc/jobs_fetcher/jobs_fetcher_cubit.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class JobConfirmationPage extends StatelessWidget {
  final String jobId;
  const JobConfirmationPage({@required this.jobId});
  @override
  Widget build(BuildContext context) {
    final mockJobLat = 38.702326;
    final mockJobLong = -9.240135;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        automaticallyImplyLeading: false,
        title: Text(
          'Job Confirmation',
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: BlocBuilder<JobsFetcherCubit, JobsFetcherState>(
        builder: (context, state) {
          if (state is FetchSingleJobInProgress) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).accentColor,
              ),
            );
          } else if (state is FetchSingleJobSuccess) {
            return SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConfirmationPageHeader(jobEntityName: state.job.posterName),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: LocationImagePreview(
                        lat: mockJobLat, long: mockJobLong),
                  ),
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    state.job.title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    state.job.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    '12 January 2021 @ 16:00 CET',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    state.job.city,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Pay Rate',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    state.job.hourRate,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: JobDisclaimer(),
                  ),
                  const SizedBox(height: 10.0),
                  RyzePrimaryButton(
                      title: 'Check In',
                      action: () {
                        Navigator.popAndPushNamed(
                          context,
                          '/qrcode-generator',
                          arguments: state.job,
                        );
                      },
                      isAffirmative: true),
                  const SizedBox(height: 12.0),
                  RyzePrimaryButton(
                    title: 'Cancel Job',
                    action: () => Navigator.pop(context),
                    isAffirmative: false,
                  ),
                  const SizedBox(height: 26.0),
                ],
              ),
            );
          } else if (state is FetchSingleJobFailure) {
            return Center(
              child: Text('Ooops! Something did go wrong!'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
