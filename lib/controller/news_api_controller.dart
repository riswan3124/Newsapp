import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp1/api_config/api_config.dart';
import 'package:newsapp1/model/model.dart';

class NewApiService with ChangeNotifier {
  TextEditingController searchcontroller = TextEditingController();
  bool isLoading = false;
  NewsApiModel apidata = NewsApiModel();
  List<Article> searchResults = [];

  final Map<String, List<Article>> _cachedData = {};

  String error = '';

  List<Article>? getCachedData(String category) {
    return _cachedData[category];
  }

  void cacheData(String category, List<Article> data) {
    _cachedData[category] = data;
  }

  Future<void> getdata({String? category}) async {
    isLoading = true;

    try {
      var response = await http
          .get(Uri.parse("${Base_url}everything?q=$category&apiKey=$API_KEY"));
      if (response.statusCode == 200) {
        var mapresponse = await jsonDecode(response.body);

        apidata = NewsApiModel.fromJson(mapresponse);
        notifyListeners();
      } else {
        print("Data Unavailable");
      }
    } catch (e) {
      error = e.toString();
      print("Error fetching data: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> searchNews({String? searchQuery}) async {
    isLoading = true;

    try {
      var response = await http.get(
          Uri.parse("${Base_url}everything?q=$searchQuery&apiKey=$API_KEY"));
      if (response.statusCode == 200) {
        var mapResponse = await jsonDecode(response.body);
        searchResults = NewsApiModel.fromJson(mapResponse).articles ?? [];
        apidata = NewsApiModel.fromJson(mapResponse);
      } else {
        print("Data Unavailable");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  onSubmit({required String searchQuery}) async {
    await searchNews(searchQuery: searchQuery);
    notifyListeners();
  }
}
