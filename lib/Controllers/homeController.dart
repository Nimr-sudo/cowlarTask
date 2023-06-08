import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_na/Models/Movies.dart';

class HomeController extends GetxController {
  final _movies = <Movies>[].obs;
  var _page = 1;
  var _isLoading = false;

  List<Movies> get movies => _movies.toList();

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }
  ///////////
  Future<void> fetchMovies() async {
    if (_isLoading) return;
    _isLoading = true;
    Movies movie=Movies(); //instance of movies model
    final newMovies = await movie.fetchMoviesFromApi(_page); //api call model , passede int page , scrolling
    //movies model
    _movies.addAll(newMovies);
    _page++;
    _isLoading = false;
  }


}
