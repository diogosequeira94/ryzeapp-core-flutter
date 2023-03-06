// ignore_for_file: close_sinks

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/details_page/widgets.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailPage extends StatelessWidget {
  final JobPost jobPost;
  final bool selfViewing;
  final bool isVerified;
  JobDetailPage(
      {@required this.jobPost,
      this.selfViewing = false,
      this.isVerified = true});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final userId = BlocProvider.of<AuthBloc>(context).userId;
    final _jobsBloc = context.read<JobsBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Job Details',
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(
              icon: selfViewing
                  ? Icon(Icons.edit)
                  : Icon(Icons.favorite_border_rounded),
              onPressed: () {}),
        ],
      ),
      body: BlocConsumer<JobsBloc, JobsState>(listener: (context, state) {
        if (state is DeleteJobFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            duration: const Duration(seconds: 2),
          ));
        } else if (state is JobApplicationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            duration: const Duration(seconds: 2),
          ));
        } else if (state is DeleteJobSuccess) {
          Navigator.pop(context);
        } else if (state is JobApplicationSuccess) {
          _jobsBloc.add(FetchJobsPosts());
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            width: width,
            child: Stack(
              children: [
                Container(
                  height: height * 0.55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(jobPost.imageUrl ??
                          'https://play-lh.googleusercontent.com/Mcz7BCEGO4vs71T3RklGvQi2vJuzxjYt_ElnuLHIlk4kkshIf0Og-JXvwbCiZatRRACS'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(top: height * 0.5),
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobPost.title,
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Text(
                              'Posted by: ${jobPost.posterName ?? 'Unknown User'}',
                            )),
                            const SizedBox(width: 6.0),
                            if (isVerified)
                              Icon(Icons.check_circle,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 22.0),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        jobPost.description,
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
                        jobPost.city,
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
                        jobPost.hourRate,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Start Date',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        '${jobPost.startDate} @ ${jobPost.startTime}',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'End Date',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        '${jobPost.endDate} @ ${jobPost.endTime}',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      DetailsSection('Positions Available',
                          jobPost.slotsAvailable.toString()),
                      DetailsSection('Current Applications',
                          jobPost.currentProposals?.length.toString() ?? '0'),
                      DetailsSection(
                          'Additional Information', jobPost.additionalInfo),
                      if (!selfViewing)
                        InkWell(
                            onTap: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  // shape: RoundedRectangleBorder(
                                  context: context,
                                  builder: (context) {
                                    return _ReportJobBottomSheet();
                                  },
                                ),
                            child: FlagAsInappropriate()),
                      const SizedBox(height: 26.0),
                      selfViewing
                          ? RyzePrimaryButton(
                              title: 'Cancel Job',
                              action: () {
                                _showDeleteConfirmationDialog(context, jobPost);
                              },
                              isLoading: state is DeleteJobInProgress,
                              isAffirmative: false,
                            )
                          : _alreadyApplied(jobPost, userId)
                              ? Column(
                                  children: [
                                    Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check_circle),
                                          const SizedBox(width: 8.0),
                                          Flexible(
                                            child: Text(
                                              'You already applied for this job',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : RyzePrimaryButton(
                                  title: 'Apply Now',
                                  action: () {
                                    final _userBloc = context.read<UserBloc>();
                                    _jobsBloc.add(JobApplyPressed(
                                      jobPost: jobPost,
                                      userProfile: _userBloc.userProfile,
                                    ));
                                  },
                                  isLoading: state is JobApplicationInProgress,
                                  isAffirmative: true,
                                )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  bool _alreadyApplied(JobPost jobPost, String uId) =>
      jobPost.currentProposals.contains(uId);

  _showDeleteConfirmationDialog(BuildContext context, JobPost jobPost) {
    AwesomeDialog(
      context: context,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.NO_HEADER,
      padding: const EdgeInsets.all(8.0),
      title: 'Cancel Confirmation',
      desc: 'By cancelling you will permanently delete this job.',
      btnCancelText: 'Go Back',
      btnCancelColor: Theme.of(context).colorScheme.secondary,
      btnOkText: 'Cancel',
      btnOkColor: Colors.black,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        final _jobsBloc = context.read<JobsBloc>();
        _jobsBloc.add(DeleteJobPost(jobPost));
      },
    )..show();
  }
}

class _ReportJobBottomSheet extends StatefulWidget {
  @override
  __ReportJobBottomSheetState createState() => __ReportJobBottomSheetState();
}

class __ReportJobBottomSheetState extends State<_ReportJobBottomSheet> {
  int value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius:
                    BorderRadiusDirectional.vertical(top: Radius.circular(20))),
            padding: const EdgeInsets.all(16),
            child: ListView(
              controller: controller,
              children: [
                const SizedBox(height: 8.0),
                Text(
                  'Help Us Understand What it Happening',
                  style: TextStyle(fontSize: 22.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Select the reason below which you believe its the most suitable',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 25.0),
                RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  value: 0,
                  groupValue: value,
                  onChanged: (ind) => setState(() => value = ind),
                  title: Text('This job displays inappropriate content.'),
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  value: 1,
                  groupValue: value,
                  onChanged: (ind) => setState(() => value = ind),
                  title: Text('This is not a real job and can be considerate as spam.'),
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  value: 2,
                  groupValue: value,
                  onChanged: (ind) => setState(() => value = ind),
                  title:
                      Text('It has harassment or hate speech.'),
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  value: 3,
                  groupValue: value,
                  onChanged: (ind) => setState(() => value = ind),
                  title: Text('Duplicate post'),
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  value: 1,
                  groupValue: 3,
                  onChanged: (value) {},
                  title: Text('Something else'),
                ),
                const SizedBox(height: 50.0),
                RyzePrimaryButton(
                  title: 'Send',
                  action: () {
                    Navigator.of(context).pop();
                  },
                  isAffirmative: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
