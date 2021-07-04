import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'qr_code_reader.dart';

class QrCodePage extends StatelessWidget {
  final JobPost jobPost;
  const QrCodePage(this.jobPost);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            QrImage(
              data: '${jobPost.jobID}',
              version: 3,
              size: 250.0,
            ),
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.info_outline),
                  SizedBox(width: 5.0),
                  Expanded(
                      child: Text(
                          'Upon arrival, ask your employer to scan the QR Code')),
                ],
              ),
            ),
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RyzePrimaryButton(
                  title: 'Click to Scan',
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRCodeReader(
                            jobPost: jobPost, dataToScan: '${jobPost.jobID}'),
                      ),
                    );
                  },
                  isAffirmative: true),
            ),
          ],
        ),
      ),
    );
  }
}
