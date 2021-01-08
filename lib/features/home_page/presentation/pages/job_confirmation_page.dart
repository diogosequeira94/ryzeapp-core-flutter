import 'package:firebaseblocryze/features/home_page/presentation/widgets/confirmation_page/confirmation_page_header.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/confirmation_page/job_disclaimer.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/confirmation_page/location_image_preview.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class JobConfirmationPage extends StatelessWidget {
  final JobPost jobPost;
  const JobConfirmationPage({@required this.jobPost});
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConfirmationPageHeader(jobEntityName: jobPost.title),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: LocationImagePreview(lat: mockJobLat, long: mockJobLong),
            ),
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
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: JobDisclaimer(),
            ),
            const SizedBox(height: 10.0),
            RyzePrimaryButton(
                title: 'Check In',
                action: () => Navigator.pop(context),
                isAffirmative: true),
            const SizedBox(height: 12.0),
            RyzePrimaryButton(
                title: 'Cancel Job',
                action: () => Navigator.pop(context),
                isAffirmative: false),
            const SizedBox(height: 26.0),
          ],
        ),
      ),
    );
  }
}
