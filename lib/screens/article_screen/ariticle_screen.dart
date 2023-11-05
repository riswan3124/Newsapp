import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp1/constants/constants.dart';
import 'package:newsapp1/controller/news_api_controller.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatefulWidget {
  ArticleScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    var providerwatch = context.watch<NewApiService>();
    // var article = providerwatch.apidata.articles![widget.index];
    Widget sizedBox = SizedBox(
      height: 15,
    );

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          flexibleSpace: Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(providerwatch
                        .apidata.articles![widget.index].urlToImage
                        .toString())),
                color: Colors.black.withOpacity(0.04),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          toolbarHeight: 350,
          backgroundColor: Colors.white,
          elevation: 0,
          floating: false,
          snap: false,
          pinned: false,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 1,
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    providerwatch.apidata.articles![index].title.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                  sizedBox,
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(providerwatch
                          .apidata.articles![index].urlToImage
                          .toString()),
                    ),
                    title: Text(providerwatch.apidata.articles![index].author
                        .toString()),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(providerwatch
                          .apidata.articles![index].source!.name
                          .toString()),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.thumb_up,
                              color: primaryClr,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.thumb_down_alt_outlined,
                              color: primaryClr,
                            )),
                      ],
                    ),
                  ),
                  sizedBox,
                  Divider(
                    thickness: 2,
                  ),
                  sizedBox,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            providerwatch.apidata.articles![index].content
                                .toString(),
                            style: TextStyle(fontSize: 16, height: 1.8),
                            textAlign: TextAlign.justify,
                          ),
                          Divider(),
                          Text(
                            providerwatch.apidata.articles![index].description
                                .toString(),
                            style: TextStyle(fontSize: 16, height: 1.8),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    ));
  }
}
