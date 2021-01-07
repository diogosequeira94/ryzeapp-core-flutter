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
        child: Image.network(getJobLocation(),
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
