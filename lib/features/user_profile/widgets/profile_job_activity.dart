import 'package:flutter/material.dart';

class ProfileJobActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Job Activity',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  title: Text('Lux Bar Lisbon'),
                  subtitle: Text('Bartender'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Icon(Icons.calendar_today_outlined, size: 18.0)),
                      const SizedBox(width: 2.0),
                      Text('21/06/2021'),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
