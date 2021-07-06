import 'package:flutter/material.dart';

class JobInviteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 70,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                color: _getJobColor('Restaurant'),
                width: 70,
                height: 70,
                child: _getJobIcon('Restaurant'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Tagliatelle',
                        style:
                            TextStyle(color: Colors.black87, fontSize: 15.0)),
                    Text(
                      'Kitchen Porter',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child:
                    Text('19/06/2021', style: TextStyle(color: Colors.black54)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Icon _getJobIcon(String category) {
    switch (category) {
      case 'Bar':
        return Icon(Icons.local_drink, color: Colors.white);
      case 'Restaurant':
        return Icon(Icons.restaurant, color: Colors.white);
      default:
        return Icon(Icons.person_outlined, color: Colors.white);
    }
  }

  Color _getJobColor(String category) {
    switch (category) {
      case 'Bar':
        return Colors.deepPurpleAccent;
      case 'Restaurant':
        return Colors.red;
      default:
        return Colors.blueAccent;
    }
  }
}
