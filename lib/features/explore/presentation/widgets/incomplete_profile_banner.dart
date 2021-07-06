import 'package:flutter/material.dart';

class IncompleteProfileBanner extends StatelessWidget {
  final bool showAlert;
  const IncompleteProfileBanner({this.showAlert = false});

  @override
  Widget build(BuildContext context) {
    return showAlert
        ? Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 14.0, bottom: 4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              margin: const EdgeInsets.all(0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: 110.0,
                  width: double.infinity,
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 38.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Incomplete Profile',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Complete your profile to apply for jobs and get hired.',
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
            ),
          )
        : SizedBox.shrink();
  }
}
