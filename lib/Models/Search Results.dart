import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

import '../Utilities/configuration.dart';
class Search{
   List<dynamic> searchResults=[];
  Future<List> searchMovies(String query) async {
    final String url =
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query';
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      searchResults = jsonDecode(response.body)['results'];

      print(searchResults);
      print('After call');
      return searchResults;
    } else {
      print('Error: ${response.reasonPhrase}');
      return [];
    }
  }


}