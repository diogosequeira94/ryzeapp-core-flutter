import 'package:firebaseblocryze/features/home_page/utils/location_util.dart';
import 'package:flutter/material.dart';

class LocationImagePreview extends StatelessWidget {
  final double lat, long;
  const LocationImagePreview({@required this.lat, @required this.long});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 175,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: Image.network('https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/denver/Maps_8b394d1e-613f-44d4-9ad0-6b5f8a4ffcab.png',
            fit: BoxFit.cover, width: double.infinity),
      ),
      onTap: () => LocationUtil.navigateTo(latitude: lat, longitude: long),
    );
  }

  String getJobLocation() {
    return LocationUtil.generateLocationPreviewImage(
        latitude: lat, longitude: long);
  }
}
