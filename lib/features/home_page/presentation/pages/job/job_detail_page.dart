import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/details_page/details_section.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/details_page/flag_as_inappropriate_widget.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            duration: const Duration(seconds: 2),
          ));
        } else if (state is JobApplicationFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            duration: const Duration(seconds: 2),
          ));
        } else if (state is DeleteJobSuccess) {
          Navigator.pop(context);
        } else if (state is JobApplicationSuccess) {
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
                                  color: Theme.of(context).accentColor,
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
                          jobPost.currentProposals.toString() ?? '0'),
                      DetailsSection(
                          'Additional Information', jobPost.additionalInfo),
                      if (!selfViewing) FlagAsInappropriate(),
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
                          : RyzePrimaryButton(
                              title: 'Apply Now',
                              action: () {
                                final _jobsBloc = context.read<JobsBloc>();
                                _jobsBloc.add(JobApplyPressed(jobPost));
                                //ToDo : Confirmation page is only visible after Employer accepts
                                // Navigator.popAndPushNamed(
                                //     context, '/job-confirmation-page',
                                //     arguments: jobPost);
                              },
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
      btnCancelColor: Theme.of(context).accentColor,
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
