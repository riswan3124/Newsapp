import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp1/constants/constants.dart';
import 'package:newsapp1/controller/news_api_controller.dart';
import 'package:newsapp1/screens/home_screen/widgets/tabbars/customtabbars.dart';

import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<NewApiService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteclr,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News App",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 24),
            ),
            Image.asset(
              "assets/images/news-break-local-breaking-2018-09-12.png",
              height: 20,
              width: 30,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: whiteclr,
              toolbarHeight: 180,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Search News',
                          style: GoogleFonts.poppins(fontSize: 24),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'News from all over the world',
                          style: GoogleFonts.lato(color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Center(
                                child: TextFormField(
                                  autocorrect: true,
                                  cursorColor: Colors.grey,
                                  onFieldSubmitted: (value) {
                                    providerRead.onSubmit(
                                        searchQuery: searchController.text);
                                    setState(() {});
                                  },
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        providerRead.onSubmit(
                                            searchQuery: searchController.text);
                                        setState(() {});
                                      },
                                      child: Icon(Icons.search),
                                    ),
                                    hintText: "Search for news",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: searchController.text.isNotEmpty
            ? CustomTabBarView(
                future:
                    providerRead.searchNews(searchQuery: searchController.text),
                category: searchController.text,
              )
            : Center(
                child: Lottie.asset(
                    "assets/json/Animation - 1698747429471.json",
                    height: 150,
                    width: 180)),
      ),
    );
  }
}
