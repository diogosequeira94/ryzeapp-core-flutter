import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class JobDetailPage extends StatelessWidget {
  final JobPost jobPost;
  JobDetailPage({@required this.jobPost});

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
          style: TextStyle(
            color: Theme.of(context).textTheme.headline6.color
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(icon: Icon(Icons.star_border), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
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
                padding: const EdgeInsets.all(30.0),
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
                            'RyzeApp',
                          )),
                          const SizedBox(width: 6.0),
                          Icon(Icons.check_circle,
                              color: Theme.of(context).accentColor, size: 22.0),
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
                      'Positions Available',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      jobPost.slotsAvailable.toString(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 26.0),
                    RyzePrimaryButton(
                        title: 'Apply Now',
                        action: () {
                          Navigator.popAndPushNamed(
                              context, '/job-confirmation-page',
                              arguments: jobPost);
                        },
                        isAffirmative: true)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
