import 'dart:convert';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_na/Models/Movies.dart';

import '../Models/movieDetail.dart';
import '../Utilities/configuration.dart';

class MovieDetailsController extends GetxController {
  late Future<Map<String, dynamic>> _movieDetailsFuture;
  late Future<Map<String, dynamic>> _movieImagesFuture;
  late Future<Map<String, dynamic>> _movieVideoFuture;
  late String trailerKey = '';
  late MovieDetail args;
  late RxList genres = [].obs;
  late Map nextArgs;

  List<Color> colors = [
    Color(0xFF15D2BC),
    Color(0xFFE26CA5),
    Color(0xFF564CA3),
    Color(0xFFCD9D0F)
  ];
  @override
  Future  onInit() async{
    args = Get.arguments as MovieDetail;
    print(args);
Movies movie=Movies();
    print(args.title);
    print(args.overview);
    _movieDetailsFuture = Future.value(await movie.getMovieDetails(args.movieId));
    genres.value=movie.genres;
    // _movieImagesFuture = _getMovieImages();
    _movieVideoFuture = Future.value(await movie.getMovieVideos(args.movieId));
    nextArgs=movie.nextArgs;
    // ...
    super.onInit();
  }



}
