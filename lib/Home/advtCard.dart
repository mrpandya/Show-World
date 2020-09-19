import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdvertisementCardTop extends StatelessWidget {
  final List<String> _urls;
  AdvertisementCardTop(this._urls);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
//        width: _width * 0.9,
        decoration: BoxDecoration(
          color: Colors.transparent,
//            boxShadow: [
//              BoxShadow(
//                  color: Colors.white,
//                  blurRadius: 2,
//                  spreadRadius: 0.5,
//                  offset: Offset(-1, -1)),
//              BoxShadow(
//                  color: Colors.grey[600],
//                  blurRadius: 2,
//                  spreadRadius: 0.5,
//                  offset: Offset(1, 1))
//            ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: CarouselSlider.builder(
          itemCount: _urls.length,
          itemBuilder: (context, index) {
            return Image.network(
              _urls.elementAt(index),
              key: ValueKey(index),
              fit: BoxFit.fill,
            );
          },
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}

class AdvertisementCardBottom extends StatelessWidget {
  final List<String> _urls;
  AdvertisementCardBottom(this._urls);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
//            boxShadow: [
//              BoxShadow(
//                  color: Colors.white,
//                  blurRadius: 2,
//                  spreadRadius: 0.5,
//                  offset: Offset(-1, -1)),
//              BoxShadow(
//                  color: Colors.grey[600],
//                  blurRadius: 2,
//                  spreadRadius: 0.5,
//                  offset: Offset(1, 1))
//            ],
            borderRadius: BorderRadius.circular(10)),
//        width: _width * 0.9,
        child: CarouselSlider.builder(
          itemCount: _urls.length,
          itemBuilder: (context, index) {
            return Image.network(
              _urls.elementAt(index),
              key: ValueKey(index),
              fit: BoxFit.fill,
            );
          },
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
