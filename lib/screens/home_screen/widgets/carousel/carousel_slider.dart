import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp1/controller/news_api_controller.dart';
import 'package:provider/provider.dart';

class CarouselsliderWidget extends StatelessWidget {
  const CarouselsliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var providerWatch = context.watch<NewApiService>();
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(providerWatch
                        .apidata.articles![index].urlToImage
                        .toString())),
                color: Colors.black,
                borderRadius: BorderRadius.circular(15)),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
      ),
    );
  }
}
