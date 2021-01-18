import 'package:flutter/material.dart';

class JobStatusPill extends StatelessWidget {
  final String jobStatus;

  const JobStatusPill({@required this.jobStatus}) : assert(jobStatus != null);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Material(
        key: Key('jobStatusPill_material'),
        color: _getPillColor(jobStatus),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 20.0,
          width: 58.0,
          child: Center(
              child: Text(jobStatus,
                  maxLines: 1,
                  style: TextStyle(fontSize: 13.5))),
        ),
      ),
    );
  }

  Color _getPillColor(String jobStatus) {
    switch (jobStatus) {
      case 'Active':
        return Colors.lightGreen;
        break;
      case 'Inactive':
        return Colors.orangeAccent;
        break;
      case 'On Going':
        return Colors.deepPurple;
        break;
      case 'Done':
        return Color(0xFFDD0000);
        break;
      default:
        return Colors.transparent;
    }
  }
}
