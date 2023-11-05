import 'package:flutter/material.dart';

import '../screens/home_screen/home_screen.dart';
import '../screens/search_screen/search_screen.dart';

class ButtonActionController with ChangeNotifier {
  int currentIndex = 0;

  bool isfavtapped = false;
  bool isBookMarktapped = false;

  List<Widget> screens = [HomeScreen(), SearchScreen()];

  bottomOntap({required int index}) {
    currentIndex = index;
    notifyListeners();
  }
}
