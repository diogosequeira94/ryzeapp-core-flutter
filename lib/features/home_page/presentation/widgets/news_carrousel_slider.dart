import 'package:carousel_slider/carousel_slider.dart';
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
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://thepienews.com/wp-content/uploads/2016/12/Kendall-College-School-of-Hospitality-Management-2-860x375.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            CarouselSlider(
              items: imageSliders(),
              options: CarouselOptions(
                  autoPlay: true,
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
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
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
                Image.network(item, fit: BoxFit.cover, width: double.infinity),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
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