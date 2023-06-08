import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_na/Utilities/configuration.dart';

import '../Models/Search Results.dart';

class SearchController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  RxList<dynamic> searchResults = [].obs;
  /////////// list of maps
  final RxString searchQuery = ''.obs;
  List categories = [
    {
      'name': 'Comedy',
      'image': 'assets/icons/Rectangle 2235comedy.png',
    },
    {
      'name': 'Crime',
      'image': 'assets/icons/Rectangle 2236crme.png',
    },
    {
      'name': 'Family',
      'image': 'assets/icons/Rectangle 2237family.png',
    },
    {
      'name': 'Documentaries',
      'image': 'assets/icons/Rectangle 2238documentaries.png',
    },
    {
      'name': 'Dramas',
      'image': 'assets/icons/Rectangle 2239dramas.png',
    },
    {
      'name': 'Fantasy',
      'image': 'assets/icons/Rectangle 2240fantasy.png',
    },
    {
      'name': 'Holidays',
      'image': 'assets/icons/Rectangle 2241holidays.png',
    },
    {
      'name': 'Horror',
      'image': 'assets/icons/Rectangle 2242horror.png',
    },
    {
      'name': 'Sci-Fi',
      'image': 'assets/icons/Rectangle 2243scifi.png',
    },
    {
      'name': 'Thriller',
      'image': 'assets/icons/Rectangle 2244thriller.png',
    },
  ];

  Future updateSearchQuery(String query) async {
    Search newSearch= Search();
    searchQuery.value = query;

    searchResults.value= await newSearch.searchMovies(searchQuery.value);
  }
}
