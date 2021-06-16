import 'package:flutter/material.dart';

class ChatMessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text('Messages',
            style:
                TextStyle(color: Theme.of(context).textTheme.headline6.color)),
      ),
      body: _buildNotificationDummy(),
    );
  }

  _buildNotificationDummy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.message_outlined, size: 80, color: Colors.black45),
          const SizedBox(height: 24.0),
          Text('You have no messages or chats.',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
