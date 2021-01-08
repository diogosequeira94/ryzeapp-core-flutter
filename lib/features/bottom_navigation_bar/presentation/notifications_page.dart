import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.message_outlined, color: Colors.black54)),
              Tab(
                  icon:
                      Icon(Icons.watch_later_outlined, color: Colors.black54)),
            ],
          ),
          title: Text('Notifications', style: TextStyle(color: Theme.of(context).textTheme.headline6.color)),
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
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center),
          const SizedBox(height: 8.0),
          Text('When you have job updates, messages or news, it will be showed here.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
