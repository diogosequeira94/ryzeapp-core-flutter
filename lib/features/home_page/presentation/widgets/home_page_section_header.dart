import 'package:firebaseblocryze/features/home_page/presentation/pages/job_creation_page.dart';
import 'package:flutter/material.dart';

class HomePageSectionHeader extends StatelessWidget {
  final String title;
  final bool hasAction;
  const HomePageSectionHeader({@required this.title, @required this.hasAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          hasAction ? InkWell(child: Icon(Icons.add), onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobCreation()));
          }) : SizedBox.shrink(),
        ],
      ),
    );
  }
}