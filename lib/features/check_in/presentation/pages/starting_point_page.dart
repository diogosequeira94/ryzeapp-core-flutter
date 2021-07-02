import 'package:firebaseblocryze/features/check_in/presentation/widgets/check_in_header.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/confirmation_page/widgets.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';

class StartingPointPage extends StatelessWidget {
  final JobPost jobPost;
  const StartingPointPage(this.jobPost);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Check In',
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckInPageHeader(userName: 'Diogo Sequeira'),
            const SizedBox(height: 6.0),
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
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: JobDisclaimer(),
            ),
            const SizedBox(height: 10.0),
            RyzePrimaryButton(
                title: 'Start',
                action: () {
                  /// Start Job!
                },
                isAffirmative: true),
            const SizedBox(height: 26.0),
          ],
        ),
      ),
    );
  }
}
