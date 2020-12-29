import 'package:flutter/material.dart';

class ProfilePageHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
      child: Container(
        width: width,
        height: height / 4.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                  'https://i.insider.com/5dade9bc045a3139e8686c33?width=1136&format=jpeg',
                  fit: BoxFit.fill,
                  height: 150,
                  width: 150),
            ),
            SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text('Walter White', style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600
                  ),),
                ),
                Text('Professional Meth Cook',
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black54
                  ),),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.camera_alt, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Icon(Icons.mail, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Icon(Icons.add, color: Colors.blueAccent),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
