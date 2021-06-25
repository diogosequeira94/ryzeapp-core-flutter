import 'package:firebaseblocryze/features/home_page/presentation/pages/job/job_detail_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/home_page/home_page_section_header.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/job_status_pill.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobHubPage extends StatelessWidget {
  final List<JobPost> myJobsList;
  final JobsBloc jobsBloc;
  JobHubPage({@required this.myJobsList, @required this.jobsBloc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          JobPostStrings.jobHubPageTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageSectionHeader(
                title: 'Job Posts',
                edgeInsets: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myJobsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                              myJobsList[index].imageUrl ??
                                  'https://play-lh.googleusercontent.com/Mcz7BCEGO4vs71T3RklGvQi2vJuzxjYt_ElnuLHIlk4kkshIf0Og-JXvwbCiZatRRACS',
                              width: 75,
                              height: 75,
                              fit: BoxFit.cover)),
                      title: Text(myJobsList[index].title),
                      subtitle: Text(myJobsList[index].city),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(myJobsList[index].hourRate),
                          JobStatusPill(jobStatus: myJobsList[index].status),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobDetailPage(
                                      jobPost: myJobsList[index],
                                    )));
                      },
                      onLongPress: () {
                        _showDeleteConfirmationDialog(
                            context, myJobsList[index]);
                      },
                    ),
                  );
                },
              ),
            ),
            HomePageSectionHeader(
                title: 'Job Appliances',
                edgeInsets: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0)),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, bottom: 8.0),
              child: Text('You haven\'t applied to any Job yet.'),
            )
          ],
        ),
      ),
    );
  }

  _showDeleteConfirmationDialog(BuildContext context, JobPost jobPost) {
    AwesomeDialog(
      context: context,
      width: 350,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.NO_HEADER,
      title: 'Delete Confirmation',
      desc: 'Are you sure you want to permanently delete this job?',
      btnCancelText: 'Resume',
      btnCancelColor: Colors.blueAccent,
      btnOkText: 'Delete',
      btnOkColor: Colors.black,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        jobsBloc.add(DeleteJobPost(jobPost));
      },
    )..show();
  }
}
