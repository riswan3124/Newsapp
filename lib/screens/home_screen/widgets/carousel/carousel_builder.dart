// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:world_news/constants/constants.dart';
// import 'package:world_news/controller/news_api_controller.dart';
// import 'package:world_news/screens/home_screen/widgets/carousel/carousel_slider.dart';
// import 'package:world_news/widgets/shimmer/shimmer_cutom.dart';

// class CarouselCustom extends StatelessWidget {
//   const CarouselCustom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: context.read<NewApiService>().getdata(category: "trending"),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return ListView.builder(
//             itemBuilder: (context, index) {
//               return ShimmerWidget.rectangular(height: 150, width: 250);
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error: ${snapshot.error}'),
//           );
//         } else {
//           var getdata = context.watch<NewApiService>().apidata.articles;
//           if (getdata != null && getdata.isNotEmpty) {
//             return CarouselSlider.builder(
//               itemCount: 5,
//               itemBuilder: (context, index, realIndex) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 150,
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage(
//                                 getdata[index].urlToImage.toString())),
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(15)),
//                   ),
//                 );
//               },
//               options: CarouselOptions(
//                 autoPlay: true,
//               ),
//             );
//           } else {
//             return Center(
//               child: Text(
//                 'Cannot Fetch Data',
//                 style: TextStyle(color: greyclr, fontSize: 20),
//               ),
//             );
//           }
//         }
//       },
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp1/constants/constants.dart';
import 'package:newsapp1/controller/news_api_controller.dart';
import 'package:newsapp1/screens/home_screen/widgets/carousel/db/carousel_images.dart';
import 'package:newsapp1/widgets/shimmer/shimmer_custom.dart';
import 'package:provider/provider.dart';

class CarouselCustom extends StatelessWidget {
  const CarouselCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewApiService>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ShimmerWidget.rectangular(height: 150, width: 230);
            },
          );
        } else if (provider.error.isNotEmpty) {
          return Center(
            child: Text('Error: ${provider.error}'),
          );
        } else {
          var getdata = provider.apidata.articles;
          if (getdata != null && getdata.isNotEmpty) {
            return CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(images[index])),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlayCurve: Curves.easeIn,
                autoPlay: true,
              ),
            );
          } else {
            return Center(
              child: Text(
                'Cannot Fetch Data',
                style: TextStyle(color: greyclr, fontSize: 20),
              ),
            );
          }
        }
      },
    );
  }
}
