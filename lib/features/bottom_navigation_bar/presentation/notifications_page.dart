import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.close, color: Colors.black),
            onTap: () => Navigator.of(context).pop(),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.message_outlined, color: Colors.black54)),
              Tab(
                  icon:
                      Icon(Icons.watch_later_outlined, color: Colors.black54)),
            ],
          ),
          title: Text('Notifications', style: TextStyle(color: Colors.black)),
        ),
        body: TabBarView(
          children: [
            _buildNotificationDummy(),
            _buildNotificationDummy(),
          ],
        ),
      ),
    );
  }

  _buildNotificationDummy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none, size: 80, color: Colors.black45),
          const SizedBox(height: 24.0),
          Text(
              'You have no notifications right now.',
              textAlign: TextAlign.center),
          const SizedBox(height: 8.0),
          Text('When you have job updates, messages or news, it will be showed here.', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
