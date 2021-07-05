import 'package:flutter/material.dart';

class CovidPandemicAlert extends StatelessWidget {
  final bool showAlert;
  const CovidPandemicAlert({this.showAlert = false});

  @override
  Widget build(BuildContext context) {
    return showAlert
        ? Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 14.0, bottom: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                height: 100.0,
                width: double.infinity,
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notification_important,
                        size: 36.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'COVID-19 Recommendation',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Please make sure you always follow prevention guidelines and stay safe during pandemic times.',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
