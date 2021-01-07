import 'package:url_launcher/url_launcher.dart';

/// Todo This is Kaizen Apps API_KEY
const GOOGLE_API_KEY = 'AIzaSyAmGG6lsis2eE4l-foloEfqYSTNCT19iYA';

class LocationUtil {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=800x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static void navigateTo({double latitude, double longitude}) async {
    var uri = Uri.parse("google.navigation:q=$latitude,$longitude&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}

