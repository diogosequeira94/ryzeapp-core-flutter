import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class NewsCarouselSliderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsCarouselSliderWidgetState();
  }
}

class NewsCarouselSliderWidgetState extends State<NewsCarouselSliderWidget> {
  int _current = 0;

  final List<String> imgList = [
    'https://www.raconteur.net/wp-content/uploads/2016/09/Hospitality-industry-is-set-to-thrive.jpg',
    'https://chilledmagazine.com/wp-content/uploads/2020/03/Aid-For-Bartenders-During-Bar-Closures-feat.jpg',
    'https://tr2.cbsistatic.com/hub/i/r/2019/08/06/53468105-5f4b-45dc-b51d-9c901a348849/resize/1200x/11c5f180724798e54b70230c844a129a/istock-1036557452.jpg',
    'https://jornaleconomico.sapo.pt/wp-content/uploads/2018/01/encomenda_correio.jpg',
    'https://thepienews.com/wp-content/uploads/2016/12/Kendall-College-School-of-Hospitality-Management-2-860x375.png'
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
          children: [
            CarouselSlider(
              items: imageSliders(),
              options: CarouselOptions(
                  height: height / 3.8,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  aspectRatio: 2.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? sharedPrefs.isDarkModeSelected ? Colors.white : Color.fromRGBO(0, 0, 0, 0.9)
                        : sharedPrefs.isDarkModeSelected ? Colors.white38 : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          ]
      );
  }

  List<Widget> imageSliders() {
    return imgList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(imageUrl: item, fit: BoxFit.cover, width: double.infinity),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(170, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                ),
              ],
            )
        ),
      ),
    )).toList();
  }
}