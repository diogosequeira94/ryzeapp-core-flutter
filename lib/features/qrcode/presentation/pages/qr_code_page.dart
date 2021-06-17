import 'package:firebaseblocryze/features/qrcode/presentation/pages/qr_code_reader.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Code Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Data: JobId, JobTitle, UserId'),
            QrImage(
              data: "1234567890",
              version: 3,
              size: 200.0,
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCodeReader()),
                );
              },
              child: Text('Click to Scan'),
            ),
          ],
        ),
      ),
    );
  }
}
