import 'package:flutter/material.dart';
import 'package:newsapp1/constants/constants.dart';
import 'package:newsapp1/controller/bottom_navi.dart';
import 'package:newsapp1/controller/news_api_controller.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ScreenHome extends StatefulWidget {
  ScreenHome({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    context.read<NewApiService>().getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var providerRead = context.read<ButtonActionController>();
    var providerWatch = context.watch<ButtonActionController>();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: providerWatch.currentIndex,
        onTap: (value) {
          providerRead.bottomOntap(index: value);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primaryClr,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: providerWatch.currentIndex == 0
                ? Container(
                    decoration: BoxDecoration(
                        color: secondaryclr,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.home),
                    ))
                : Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: providerWatch.currentIndex == 1
                ? Container(
                    decoration: BoxDecoration(
                        color: secondaryclr,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ))
                : Icon(Icons.search),
            label: 'Profile',
          ),
        ],
      ),
      body: providerWatch.screens[providerWatch.currentIndex],
    );
  }
}
