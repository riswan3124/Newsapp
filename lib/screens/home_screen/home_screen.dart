import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp1/constants/constants.dart';
import 'package:newsapp1/screens/home_screen/widgets/carousel/carousel_builder.dart';
import 'package:newsapp1/screens/home_screen/widgets/drawer/drawer_refact.dart';
import 'package:newsapp1/screens/home_screen/widgets/indicator/customtab_indicator.dart';
import 'package:newsapp1/screens/home_screen/widgets/tabbars/customtabbars.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryClr),
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
      ),
      drawer: MyDrawer(),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              flexibleSpace: Padding(
                  padding: const EdgeInsets.all(10.0), child: CarouselCustom()),
              toolbarHeight: 200,
              backgroundColor: whiteclr,
              elevation: 0,
              floating: false,
              snap: false,
              pinned: false,
            ),
            SliverAppBar(
              toolbarHeight: 5,
              backgroundColor: whiteclr,
              elevation: 0,
              floating: true,
              snap: true,
              pinned: true,
              bottom: TabBar(
                indicator: CustomTabIndicator(),
                isScrollable: true,
                indicatorWeight: 5,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                labelColor: primaryClr,
                unselectedLabelColor: Colors.grey.shade500,
                tabs: const [
                  Tab(text: 'Trending'),
                  Tab(text: 'Health'),
                  Tab(text: 'Sports'),
                  Tab(text: 'Politics'),
                  Tab(text: 'Business'),
                ],
              ),
            )
          ],
          body: TabBarView(
            children: [
              CustomTabBarView(category: "trending"),
              CustomTabBarView(category: "health"),
              CustomTabBarView(category: "sports"),
              CustomTabBarView(category: "politics"),
              CustomTabBarView(category: "business"),
            ],
          ),
        ),
      ),
    );
  }
}
